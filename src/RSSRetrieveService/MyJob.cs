using System;
using Quartz;
using Argotic.Extensions.Core;
using Argotic.Syndication;
using NLog;
using System.Net;

namespace RSSRetrieveService
{
    [PersistJobDataAfterExecution]
    [DisallowConcurrentExecution]
    public class MyJob : IJob
    {
        private static Logger logger = LogManager.GetCurrentClassLogger();
        public void Execute(IJobExecutionContext context)
        {
            try
            {
                // TestLoad();
                GetRss();
                var ccDal = new CcDal();
               
                ccDal.FillCarDetails();
                ccDal.Dispose();
            }
            catch(Exception ex)
            {
                logger.Error(ex.ToString());
            }
        }


        private void GetRss()
        {
            try
            {
                var ccDal = new DataAccess.Data();
                var feeds = ccDal.GetActiveFeeds();
                foreach (var feedrow in feeds)
                {
                    if (!feedrow.FeedActive)
                        continue;
                    var feed = RssFeed.Create(new Uri(feedrow.FeedRssLink));
                    if (feed.Channel.HasExtensions)
                    {
                        feed.Channel.FindExtension(DublinCoreElementSetSyndicationExtension.MatchByType);

                    }
                    foreach (var item in feed.Channel.Items)
                    {
                        if (item.HasExtensions)
                        {

                            var dcExt = item.FindExtension(DublinCoreElementSetSyndicationExtension.MatchByType) as
                                        DublinCoreElementSetSyndicationExtension;
                            if (dcExt != null)
                            {
                                ccDal.InsertRawData(dcExt.Context.Date.ToLocalTime(), item.Link.AbsoluteUri, WebUtility.HtmlDecode(item.Title), WebUtility.HtmlDecode(item.Description), feedrow.Id);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
            }
        }
    }
}
