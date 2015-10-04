using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using DataAccess.Entities;
using System.Web;

namespace DataAccess
{
    public class Data : IDisposable
    {
        private bool _disposed;
        private readonly SqlConnection conn;
        public Data()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CarCrawler"].ConnectionString);
        }

        public void InsertRawData(DateTime dateIn, string link, string title, string description, int feedId)
        {
            conn.Execute("usp_Car_Create",

                         new
                             {
                                 DateIn = dateIn,
                                 Link = link,
                                 Title =  HttpUtility.HtmlDecode(title),
                                 Description = HttpUtility.HtmlDecode(description),
                                 FeedId = feedId
                             }, commandType: CommandType.StoredProcedure);
        }

        public void InsertHtmlData(Html html)
        {
            conn.Execute("usp_Html_Create",

                        html, commandType: CommandType.StoredProcedure);
        }

        public List<Html> GetAllHtmUnprocessed()
        {
            return conn.Query<Html>("usp_Html_GetAllUnProcessed", commandType: CommandType.StoredProcedure).ToList();
        } 

        public void BatchEmailSent(int emailId)
        {
            conn.Execute("usp_Email_UpdateEmailSent", new { Id = emailId }, commandType: CommandType.StoredProcedure
                        );
        }

        public void CleanDB()
        {
            conn.Execute("usp_CleanTables", commandType: CommandType.StoredProcedure);
        }
        public List<RegEx> GetRegEx(string type)
        {
            return conn.Query<RegEx>("usp_RegEx_GetByRegExType", new {RegExType = type},
                              commandType: CommandType.StoredProcedure).ToList();

        }

        public Query GetQueryById(Int16 id)
        {
            return
                conn.Query<Query>("usp_Query_GetSingle", new {Id = id}, commandType: CommandType.StoredProcedure)
                    .FirstOrDefault();
        }

        public List<string> GetDistinctMakes(int year)
        {
            return conn.Query<string>("usp_MakeModel_GetDistinctMake", new {Year = year},
                                   commandType: CommandType.StoredProcedure).ToList();
        }

        public List<string> GetDistinctModel(int year, string make)
        {
                 return
                    conn.Query<string>("usp_MakeModel_GetDistinctModel", new { Year = year, Make = make }, commandType: CommandType.StoredProcedure)
                        .ToList();
        }

             public void CleanTables()
             {
                 conn.Execute("usp_CleanTables", commandType: CommandType.StoredProcedure);
             }


        public List<CarDetail> GetEmptyDetail()
        {

            return conn.Query<CarDetail>("usp_CarDetail_GetAll", commandType: CommandType.StoredProcedure).ToList();
        }

        public List<Car> GetAllCars()
        {

            return conn.Query<Car>("select * from car", commandType: CommandType.Text).ToList();
        }

        public List<Feed> GetFeeds()
        {
            return conn.Query<Feed>("usp_Feed_GetAll",
                   commandType: CommandType.StoredProcedure).ToList();

        }
        public List<Feed> GetActiveFeeds()
        {
            return conn.Query<Feed>("usp_Feed_GetActive",
                   commandType: CommandType.StoredProcedure).ToList();

        }

        public void UpdateCars(Car car)
        {
            conn.Execute("usp_Car_Update", car, commandType: CommandType.StoredProcedure);
        }
         
        public void UpdateCarDetail(CarDetail carDetail)
        {
            conn.Execute("usp_CarDetail_Update",
                         new
                             {
                                 Id = carDetail.Id,
                                 Make = carDetail.Make,
                                 Model = carDetail.Model,
                                 Miles = carDetail.Miles,
                                 Year = carDetail.Year,
                                 Price = carDetail.Price
                             }, commandType: CommandType.StoredProcedure);
        }

        public int CheckForDups(int id)
        {
            var dynParam = new DynamicParameters(new { id = id});
            return conn.Query<int>("usp_CheckForDup", dynParam, commandType: CommandType.StoredProcedure).FirstOrDefault();
        }

        public List<Email> GetBatchemailsToSend()
        {
            return conn.Query<Email>("usp_Email_GetAllUnSent", commandType: CommandType.StoredProcedure).ToList();
         }

        public int InsertEmail(Email email)
        {
 
            var dynParam = new DynamicParameters(new { EmailGeneratedDate = email.EmailGeneratedDate, EmailSubject = email.EmailSubject, EmailMessage = email.EmailMessage, EmailSent = email.EmailSent});
            dynParam.Add("@InsertedId" , dbType: DbType.Int32,
                               direction: ParameterDirection.Output);
            conn.Execute("usp_Email_Create", dynParam , commandType: CommandType.StoredProcedure);
            return dynParam.Get<int>("@InsertedId");
        }

        public void InsertEmailBatch(EmailBatch emailbatch)
        {
            conn.Execute("usp_EmailBatch_Create", new {CarId = emailbatch.CarId, EmailId = emailbatch.EmailId},
                         commandType: CommandType.StoredProcedure);
        }

        public string GetRandomUserAgent()
        {
            var ua = conn.Query<UserAgent>("usp_GetRandomUserAgent", commandType: CommandType.StoredProcedure).ToList();
            return ua.First().UserAgents;
        }

        public List<Query> GetEmailQueries()
        {
            return conn.Query<Query>("usp_Query_ForEmail", commandType: CommandType.StoredProcedure).ToList();
        }
        public List<Predicate> GetPredicates()
        {
            return conn.Query<Predicate>("usp_PredicateGetAll", commandType: CommandType.StoredProcedure).ToList();
        }

        public List<Car> GetEmailsToSend(string sql)
        {
            return conn.Query<Car>(sql).ToList();
        }

        public List<Car> GetHtmlToScrape(string sql)
        {
            return conn.Query<Car>(sql).ToList();
        }

        public void UpdateMailSent(int id)
        {
            conn.Execute("usp_Car_UpdateEmailSent", new {Id = id}, commandType: CommandType.StoredProcedure);
        }

               // Implement IDisposable. http://msdn.microsoft.com/en-us/library/system.gc.suppressfinalize.aspx
        // Do not make this method virtual. 
        // A derived class should not be able to override this method. 
        public void Dispose()
        {
            Dispose(true);
            // This object will be cleaned up by the Dispose method. 
            // Therefore, you should call GC.SupressFinalize to 
            // take this object off the finalization queue  
            // and prevent finalization code for this object 
            // from executing a second time.
            GC.SuppressFinalize(this);
        }

        // Dispose(bool disposing) executes in two distinct scenarios. 
        // If disposing equals true, the method has been called directly 
        // or indirectly by a user's code. Managed and unmanaged resources 
        // can be disposed. 
        // If disposing equals false, the method has been called by the  
        // runtime from inside the finalizer and you should not reference  
        // other objects. Only unmanaged resources can be disposed. 
        private void Dispose(bool disposing)
        {
            // Check to see if Dispose has already been called. 
            if (!this._disposed)
            {
                // If disposing equals true, dispose all managed  
                // and unmanaged resources. 
                if (disposing)
                {
                    // Dispose managed resources.
                    //if (_con.State == ConnectionState.Open)
                    //    _con.Dispose();
                    conn.Dispose();

                }

                // Call the appropriate methods to clean up  
                // unmanaged resources here. 
                // If disposing is false,  
                // only the following code is executed.
            }
            _disposed = true;
        }

        // Use C# destructor syntax for finalization code. 
        // This destructor will run only if the Dispose method  
        // does not get called. 
        // It gives your base class the opportunity to finalize. 
        // Do not provide destructors in types derived from this class.
        ~Data()
        {
            // Do not re-create Dispose clean-up code here. 
            // Calling Dispose(false) is optimal in terms of 
            // readability and maintainability.
            Dispose(false);
        }


    }
}
