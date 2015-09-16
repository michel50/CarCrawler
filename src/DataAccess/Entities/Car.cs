using System;

namespace DataAccess.Entities
{
    public class Car
    {
        public int Id { get; set; }
        public DateTime DateIn { get; set; }
        public string Link { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public int? Miles { get; set; }
        public Int16? Year { get; set; }
        public decimal? Price { get; set; }
        public Int16? FeedId { get; set; }
        public bool Processed { get; set; }
        public bool EmailSent { get; set; }
    }

    public class CarDetail
    {
            public int Id { get; set; }
            public string Title { get; set; }
            public string Description { get; set; }
            public string Make { get; set; }
            public string Model { get; set; }
            public int? Miles { get; set; }
            public Int16? Year { get; set; }
            public decimal? Price { get; set; }
    }

}
