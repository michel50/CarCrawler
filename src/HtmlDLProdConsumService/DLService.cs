using Atlas;
using Quartz;

namespace HtmlDLProdConsumService
{
    public class DlService: IAmAHostedProcess
    {

        private int IntervalInMinutes { get; set; }

        public IScheduler Scheduler { get; set; }
        public IJobListener AutofacJobListener { get; set; }

        #region Implementation of IAmAHostedProcess

        public void Start()
        {
            IntervalInMinutes = Properties.Settings.Default.IntervalInMinutes;
            var job = JobBuilder.Create<MyJob>()
                .WithIdentity("JobDL")
                .Build();

            var trigger = TriggerBuilder.Create()
                .WithIdentity("TriggerDL")
                .StartNow()
                .WithCalendarIntervalSchedule(x => x.WithIntervalInMinutes(IntervalInMinutes))
                .Build();

            Scheduler.ScheduleJob(job, trigger);
            Scheduler.ListenerManager.AddJobListener(AutofacJobListener);
            Scheduler.Start();
        }

        public void Stop()
        {
            Scheduler.Shutdown();
        }

        public void Resume()
        {
            IntervalInMinutes = Properties.Settings.Default.IntervalInMinutes;
            Scheduler.ResumeAll();
        }

        public void Pause()
        {
            Scheduler.PauseAll();
        }

        #endregion
    }
}
