using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entities
{
    public class Query
    {
        public Int16 Id { get; set; }
        public string Subject { get; set; }
        public string TitleAndDescripton { get; set; }
        public byte AndOr { get; set; }
        public string Ignore { get; set; }
        public byte? MakePredicate { get; set; }
        public string MakeValue { get; set; }
        public bool MakeAllowNull { get; set; }
        public byte? ModelPredicate { get; set; }
        public string ModelValue { get; set; }
        public bool ModelAllowNull { get; set; }
        public byte? MilesPredicate { get; set; }
        public string MilesValue { get; set; }
        public bool MilesAllowNull { get; set; }
        public byte? YearPredicate { get; set; }
        public string YearValue { get; set; }
        public bool YearAllowNull { get; set; }
        public byte? PricePredicate { get; set; }
        public string PriceValue { get; set; }
        public bool PriceAllowNull { get; set; }
        public bool? Email { get; set; }
        public string EmailToSendToOwner { get; set; }
        public bool? SendEmailToOwner { get; set; }

    }
}
