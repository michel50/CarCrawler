using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CLNotifierManager
{
    class CustomDataGridView : DataGridView
    {
        public CustomDataGridView()
        {
            // if not remote desktop session then enable double-buffering optimization
            if (!System.Windows.Forms.SystemInformation.TerminalServerSession)
                DoubleBuffered = true;
        }
    }
}
