using Atlas;
using Autofac;
using System;
using NLog;
namespace HtmlDLProdConsumService
{
    public class Program
    {
        private static readonly Logger Logger = LogManager.GetCurrentClassLogger();

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main(string[] args)
        {
            try
            {
                var configuration =
                    Host.UseAppConfig<DlService>()
                        .AllowMultipleInstances()
                        .WithRegistrations(b => b.RegisterModule(new MyAutofacModule()))
                        .WithArguments(args);

                Host.Start(configuration);
            }
            catch (Exception ex)
            {
                Logger.Error(ex.ToString());
            }
        }
    }

}
