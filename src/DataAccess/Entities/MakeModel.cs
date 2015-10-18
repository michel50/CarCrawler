namespace DataAccess.Entities
{
    public class MakeModel
    {
        public int Id { get; set; }
        public int Year { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string Style { get; set; }
    }

    public class Makes
    {
        public string Make { get; set; }
        public string Model { get; set; }

    }
    public class YearMakeModel
    {
        public string Year { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
    }

}
