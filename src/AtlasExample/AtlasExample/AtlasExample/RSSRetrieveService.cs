using Atlas;
using Quartz;

namespace RSSRetrieveService
{
    public class RssRetrieveService : IAmAHostedProcess
    {

        private int IntervalInMinutes { get; set; }
        
        public IScheduler Scheduler { get; set; }
        public IJobListener AutofacJobListener { get; set; }

        #region Implementation of IAmAHostedProcess

        public void Start()
        {
            IntervalInMinutes = Properties.Settings.Default.IntervalInMinutes;
            var job = JobBuilder.Create<MyJob>()
                .WithIdentity("Job1")
                .Build();

            var trigger = TriggerBuilder.Create()
                .WithIdentity("Trigger1")
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
