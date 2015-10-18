using System;

namespace DataAccess.Entities
{
 
    public class Car
    {
        public bool EmailSent { get; set; }
        public bool Processed { get; set; }
        public bool? HtmlDownloaded { get; set; }
        public DateTime DateIn { get; set; }
        public DateTime? PostDate { get; set; }
        public decimal? Price { get; set; }
        public int Id { get; set; }
        public int? Miles { get; set; }
        public Int16? FeedId { get; set; }
        public Int16? Year { get; set; }
        public string Color { get; set; }
        public string Condition { get; set; }
        public string Description { get; set; }
        public string Drive { get; set; }
        public string Fuel { get; set; }
        public string Link { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string Size { get; set; }
        public string Title { get; set; }
        public string TitleStatus { get; set; }
        public string Transmission { get; set; }
        public string Type { get; set; }
        public string VIN { get; set; }
    } // class Car

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
