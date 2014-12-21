using System;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Expenses
{
    public partial class multipage1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // MyTabManager = 
            TabManager MyTabManager = new TabManager(this.MyMultiView, Color.DarkGray, Color.White);
            MyTabManager.AddTab(Expenses);
            MyTabManager.AddTab(Rates);
            MyTabManager.AddTab(CarMaintenance);
        }
    }
}