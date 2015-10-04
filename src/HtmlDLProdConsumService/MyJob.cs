using System;
using Quartz;
using Argotic.Extensions.Core;
using Argotic.Syndication;
using NLog;
using System.Net;

namespace HtmlDLProdConsumService
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
            }
            catch(Exception ex)
            {
                logger.Error(ex.ToString());
            }
        }
    }
}
