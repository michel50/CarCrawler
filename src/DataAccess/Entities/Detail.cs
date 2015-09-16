using System;

namespace DataAccess.Entities
{
    public class Detail
    {
        public int Id { get; set; }
        public string Make { get; set; }
        public string Mode { get; set; }
        public int? Miles { get; set; }
        public Int16? Year { get; set; }
        public decimal? Price { get; set; }
    }
}
