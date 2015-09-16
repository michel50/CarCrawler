using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entities
{
    public class Predicate
    {
        public byte Id { get; set; }
        public string PredicateSymbol { get; set; }
        public string PredicateFormat { get; set; }
        public bool PredicateForAll { get; set; }
    }
}
