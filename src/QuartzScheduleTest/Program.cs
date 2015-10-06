using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Quartz;
using Quartz.Impl;

namespace QuartzScheduleTest
{
    class Program
    {

        static void Main(string[] args)
        {
            // construct a scheduler factory
            ISchedulerFactory schedFact = new StdSchedulerFactory();

            // get a scheduler
            IScheduler sched = schedFact.GetScheduler();
            sched.Start();
            // define the job and tie it to our HelloJob class

            IJobDetail job1 = JobBuilder.Create<HelloJob>()
                    .WithIdentity("myJob1", "group1")
                    .Build();
            IJobDetail job2 = JobBuilder.Create<HelloJob>()
              .WithIdentity("myJob2", "group1")
              .Build();

            ITrigger trigger1 = TriggerBuilder.Create()
              .WithIdentity("myTrigger1", "group1")
              .StartAt(DateBuilder.DateOf(8, 0, 0))
                .WithSimpleSchedule(x => x
                .WithIntervalInMinutes(15)
                .RepeatForever())
               .EndAt(DateBuilder.DateOf(12, 0, 0))
            .Build();
            ITrigger trigger2 = TriggerBuilder.Create()
            .WithIdentity("myTrigger2", "group1")
            .StartAt(DateBuilder.DateOf(13, 0, 0))
                .WithSimpleSchedule(x => x
                 .WithIntervalInMinutes(15)
                .RepeatForever())
               .EndAt(DateBuilder.DateOf(19, 0, 0))
            .Build();

            sched.ScheduleJob(job1, trigger1);
            sched.ScheduleJob(job2, trigger2);
        }
    }
    [DisallowConcurrentExecution]
    public class HelloJob : IJob
    {
        public void Execute(IJobExecutionContext context)
        {

            Console.WriteLine("HelloJob is executing. -- " + context.Trigger.Key.Name);
        }
    }
}
