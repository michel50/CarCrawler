using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetCarQueryApi
{
    public class Make
    {
        public string make_id { get; set; }
        public string make_display { get; set; }
        public string make_is_common { get; set; }
        public string make_country { get; set; }
    }
    public class MakeList
    {
        public List<Make> Makes { get; set; }
    }
}
