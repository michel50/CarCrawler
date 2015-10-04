using System;
using System.Diagnostics;
using System.Threading;
using DataAccess.Entities;
using Quartz;
using NLog;

using System.IO;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Threading.Tasks.Dataflow;
using DataAccess;

namespace HtmlDLProdConsumService
{
    [PersistJobDataAfterExecution]
    [DisallowConcurrentExecution]
    public class MyJob : IJob
    {
        private static readonly Logger Logger = LogManager.GetCurrentClassLogger();


        public void Execute(IJobExecutionContext context)
        {
            var stopwatch = new Stopwatch();
            stopwatch.Start();
            var ct = new CancellationToken();
            var cts = new CancellationTokenSource();
            var ascb = new AscDataBlocks
            {
                Start = 1,
                End = 151
            };
            try
            {
                var ascbuffer = new BufferBlock<Parse>(new ExecutionDataflowBlockOptions
                {
                    MaxDegreeOfParallelism = 5,
                    CancellationToken = ct
                });
                var ascProcessingconsumer = ascb.AscTransConsumerAsync(ascbuffer);
                //Post source data to the dataflow block.
                ascb.AscBufferProducer(ascbuffer);
                ascbuffer.Complete();

                ascProcessingconsumer.Wait(cts.Token);
                stopwatch.Stop();

                // Write hours, minutes and seconds.

                Logger.Debug("Time elapsed: {0:hh\\:mm\\:ss}", stopwatch.Elapsed);

            }
            catch (Exception ex)
            {

                Logger.Error(ex);
            }

        }


        private class AscDataBlocks
        {
            public long Start;
            public long End;
            private readonly Data _dataAccess = new Data();
       
            //public string ThreadName;
            public void AscBufferProducer(ITargetBlock<Parse> targetAscTransform)
                // This is using TPL DataBlock producer consumer pattern.
            {
                DownloadPage(targetAscTransform);
            }

            private void DownloadPage(ITargetBlock<Parse> targetAscTransform)
            {
                foreach (var q in _dataAccess.GetEmailQueries().FindAll(x => x.Email == true))
                {

                    var cars = _dataAccess.GetHtmlToScrape(GenSqlStatementForHtmlParsing(q.Id));
                    var emailss = cars.Where(e => e.HtmlDownloaded == false);
                    foreach (var car in cars)
                    {
                        var parse = new Parse
                        {
                            CarId = car.Id,
                            Link = car.Link,
                            UserAgent = _dataAccess.GetRandomUserAgent()
                        };
                        targetAscTransform.Post(parse);
                    }
                }
            }

            private async Task LoadAsync(int carId, String url, string userAgent, CancellationToken cancel)
            {
                var handler = new HttpClientHandler {AllowAutoRedirect = false};
                var http = new HttpClient(handler);
                http.DefaultRequestHeaders.Add("User-Agent", userAgent);



                //Get a correct URL from the given one (e.g. transform codeproject.com to http://codeproject.com)
                var uri = Sanitize(url);

                //Make the request
                var request = await http.GetAsync(uri);
                //var request = await http.GetStringAsync(uri);
                cancel.ThrowIfCancellationRequested();

                //Get the response stream
                var response = await request.Content.ReadAsStringAsync();
                cancel.ThrowIfCancellationRequested();
                var html = new Html
                {
                    CarId = carId,
                    html = response,
                    Processed = false
                };
                var data = new Data();
                data.InsertHtmlData(html);
                cancel.ThrowIfCancellationRequested();

                /* Use the document */
            }

            private static Uri Sanitize(string url)
            {
                Uri uri;

                if (File.Exists(url))
                    url = "file://localhost/" + url.Replace('\\', '/');

                var lurl = url.ToLower();

                if (!lurl.StartsWith("file://") && !lurl.StartsWith("http://") && !lurl.StartsWith("https://"))
                    url = "http://" + url;

                if (Uri.TryCreate(url, UriKind.Absolute, out uri))
                    return uri;

                return new Uri("http://www.google.com/search?q=" + url);
            }

            private string GenSqlStatementForHtmlParsing(Int16 id)
            {
                var query = _dataAccess.GetQueryById(id);
                var keywords = query.TitleAndDescripton.Split(',');
                for (var i = 0; i < keywords.Length; i++)
                {

                    keywords[i] = "\"" + keywords[i].Trim() + "\"";
                }
                var contains = string.Empty;
                if (!string.IsNullOrEmpty(query.TitleAndDescripton.Trim()))
                {
                    contains = "(contains([title],'";

                    foreach (var word in keywords)
                    {
                        if (query.AndOr == 1)
                        {
                            contains += word.Trim() + " And ";
                        }
                        else
                        {
                            contains += word.Trim() + " Or ";
                        }
                    }
                    if (contains.EndsWith(" And "))
                        contains = contains.Substring(0, contains.Length - 5);
                    if (contains.EndsWith(" Or "))
                        contains = contains.Substring(0, contains.Length - 4);

                    contains += "')";
                    contains += " or contains([description],'";
                    foreach (var word in keywords)
                    {
                        if (query.AndOr == 1)
                        {
                            contains += word.Trim() + " And ";
                        }
                        else
                        {
                            contains += word.Trim() + " Or ";
                        }
                    }
                    if (contains.EndsWith(" And "))
                        contains = contains.Substring(0, contains.Length - 5);
                    if (contains.EndsWith(" Or "))
                        contains = contains.Substring(0, contains.Length - 4);
                    if (keywords.Length > 0)
                    {
                        contains += "'))";
                    }

                }
                query.Ignore = string.IsNullOrEmpty(query.Ignore) ? string.Empty : query.Ignore.Trim();
                var ignore = query.Ignore.Split(',');
                for (var i = 0; i < ignore.Length; i++)
                {
                    ignore[i] = "\"" + ignore[i].Trim() + "\"";

                }

                if (!string.IsNullOrEmpty(query.Ignore))
                {
                    if (!string.IsNullOrEmpty(contains))
                    {
                        contains += " and (not contains([title],'";
                    }
                    else
                    {
                        contains = "(not contains([title],'";
                    }
                    contains = ignore.Aggregate(contains, (current, word) => current + (word.Trim() + " And "));
                    if (contains.EndsWith(" And "))
                        contains = contains.Substring(0, contains.Length - 5);


                    contains += "')";
                    contains += " and not contains([description],'";
                    contains = ignore.Aggregate(contains, (current, word) => current + (word.Trim() + " And "));
                    if (contains.EndsWith(" And "))
                        contains = contains.Substring(0, contains.Length - 5);
                    if (contains.EndsWith(" Or "))
                        contains = contains.Substring(0, contains.Length - 4);
                    contains += "'))";


                }
                var sqlStr = "select * from car where " + contains +
                             " and (HtmlDownloaded = 0) and (datediff(day, DateIn, getdate()) < 5)";
                    //(FeedId in (select Id From Feed where FeedActive = 1))
                Logger.Debug(sqlStr);
                return sqlStr;
            }

            private void SleepRandom()
            {
                const int multiplier = 10;
                // Quartz .net  [DisallowConcurrentExecution]    http://www.quartz-scheduler.net/documentation/faq.html
                // more https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=quartz+net++%5BDisallowConcurrentExecution%5D
                Random random = new Random();
                var mseconds = random.Next(55, 90)*multiplier;
                Thread.Sleep(mseconds);
                //Console.WriteLine("slept from " + mseconds);
            }

            private void ProcessDataBuffer(Parse ascDataSet)
            {
                #region commented

                //if (ascDataSet.CarId  %3 == 0)
                //{
                //    // Testing if this will delay all the other data processing

                //    var c = new CryptoRandom();
                //    var st = c.Next(45000, 90000);
                //    var tast = LoadAsync(ascDataSet.CarId, ascDataSet.Link, ascDataSet.UserAgent, CancellationToken.None);
                //    Thread.Sleep(st);
                //    Console.WriteLine("{0} divide by 3 slept from  {1}", ascDataSet.Link, st);
                //}
                //else
                //{
                //    if (ascDataSet.CarId %2 == 0)
                //    {


                //        var c = new CryptoRandom();
                //        var st = c.Next(45000, 90000);
                //        var tast = LoadAsync(ascDataSet.CarId, ascDataSet.Link, ascDataSet.UserAgent, CancellationToken.None);
                //        Thread.Sleep(st);
                //        Console.WriteLine("{0} even slept from  {1}", ascDataSet.Link, st);

                //    }
                //    else
                //    {


                //        var c = new CryptoRandom();
                //        var st = c.Next(45000, 90000);
                //        var tast = LoadAsync(ascDataSet.CarId, ascDataSet.Link, ascDataSet.UserAgent, CancellationToken.None);
                //        Thread.Sleep(st);
                //        Console.WriteLine("{0} odd slept from  {1}", ascDataSet.Link, st);

                //    }
                //}

                #endregion

                var c = new CryptoRandom();
                var st = c.Next(45000, 90000);
                var tast = LoadAsync(ascDataSet.CarId, ascDataSet.Link, ascDataSet.UserAgent, CancellationToken.None);
                Thread.Sleep(st);
                Console.WriteLine("{0} slept from  {1}", ascDataSet.Link, st);
            }

            // Demonstrates the consumption end of the producer and consumer pattern. 
            public async Task<Parse> AscTransConsumerAsync(ISourceBlock<Parse> source)
            {
                // counter to track the number of items that are processed
                Int64 count = 0;
                var parse = new Parse();
                var actionBlock = new ActionBlock<Parse>(
                    data =>
                    {
                        ProcessDataBuffer(data);
                        // count has to be accessed in a thread-safe manner
                        // be careful about using Interlocked,
                        // for more complicated computations, locking might be more appropriate
                        Interlocked.Increment(ref count);

                    },
                    // some small constant might be better than Unbounded, depedning on circumstances
                    new ExecutionDataflowBlockOptions {MaxDegreeOfParallelism = 5}); //DataflowBlockOptions.Unbounded});

                source.LinkTo(actionBlock, new DataflowLinkOptions {PropagateCompletion = true});

                // this assumes source will be completed when done,
                // you need to call ascbuffer.Complete() after AscBufferProducer() for this
                await actionBlock.Completion;

                return parse;
            }

        }
    }

    public class CryptoRandom : Random, IDisposable
    {
        // Class data
        private RandomNumberGenerator _csp = new RNGCryptoServiceProvider();

        /// <summary> Returns a random number between 0.0 (inclusive) and 1.0 (exclusive). </summary>
        protected override double Sample()
        {
            // Get a nonnegative random Int64
            byte[] bytes = new byte[sizeof(long)];
            _csp.GetBytes(bytes);
            long value = BitConverter.ToInt64(bytes, 0) & long.MaxValue;

            // Scale it to 0->1
            return (double)value / (((double)Int64.MaxValue) + 1025.0d);
        }

        /// <summary> Fills the elements of the specified array of bytes with random numbers. </summary>
        /// <param name="buffer"> An array of bytes to contain random numbers. </param>
        public override void NextBytes(byte[] buffer)
        {
            _csp.GetBytes(buffer);
        }

        /// <summary> Returns a nonnegative random integer. </summary>
        /// <returns> A 32-bit signed integer greater than or equal to zero. </returns>
        public override int Next()
        {
            byte[] data = new byte[4];
            _csp.GetBytes(data);
            data[3] &= 0x7f;
            return BitConverter.ToInt32(data, 0);
        }

        /// <summary> Returns a random integer that is within a specified range. </summary>
        /// <param name="minValue"> The inclusive lower bound of the random number returned. </param>
        /// <param name="maxValue"> The exclusive upper bound of the random number returned. maxValue must be greater than or equal to minValue. </param>
        /// <returns> A 32-bit signed integer greater than or equal to minValue and less than maxValue; that is, the range of return values includes minValue but not maxValue. If minValue equals maxValue, minValue is returned. </returns>
        public override int Next(int minValue, int maxValue)
        {
            // Special case
            if (minValue == maxValue) return minValue;

            double sample = Sample();
            double range = (double)maxValue - (double)minValue;
            return (int)((sample * (double)range) + (double)minValue);
        }

        #region IDisposible implementation

        /// <summary> Disposes the CryptoRandom instance and all of its allocated resources. </summary>
        public void Dispose()
        {
            // Do the actual work
            Dispose(true);

            // This object will be cleaned up by the Dispose method. Call GC.SupressFinalize to 
            // take this object off the finalization queue and prevent finalization code for this object 
            // from executing a second time.
            GC.SuppressFinalize(this);
        }

        // Dispose(bool disposing) executes in two distinct scenarios:
        //
        // If disposing is true, the method has been called directly or indirectly by a user's code and both
        // managed and unmanaged resources can be disposed. 
        //
        // If disposing is false, the method has been called by the runtime from inside the finalizer.
        // In this case, only unmanaged resources can be disposed. 
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                // The method has been called directly or indirectly by a user's code; dispose managed resources (if any)
                if (_csp != null)
                {
                    _csp.Dispose();
                    _csp = null;
                }

                // Dispose unmanaged resources (if any)
            }
        }

        #endregion
    }

}
