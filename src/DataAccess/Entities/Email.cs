using System;

namespace DataAccess.Entities
{
    public class Email
    {
        public int Id { get; set; }
        public DateTime? EmailGeneratedDate { get; set; }
        public string EmailSubject { get; set; }
        public string EmailMessage { get; set; }
        public bool? EmailSent { get; set; }
    }
}
