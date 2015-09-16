using System;

namespace DataAccess.Entities
{
    public class RegEx
    {
        public Int16 Id { get; set; }
        public Int16 RegExOrder { get; set; }
        public string RegExType { get; set; }
        public string RegExExpression { get; set; }
    }
}
