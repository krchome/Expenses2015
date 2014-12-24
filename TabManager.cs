using System;
using System.Collections.Generic;
using System.Collections;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;

namespace Expenses
{
    public class TabManager
    {
        private Color SelectedTabColor;
        private Color NotSelectedTabColor;
        private MultiView MyMultiview;
        private Hashtable Tabs;
       // private EventHandler LinkButton_Click;

        public TabManager(MultiView MyMultiview, Color SelectedTabColor, Color NotSelectedTabColor)
        {
            Tabs = new Hashtable();
            this.MyMultiview = MyMultiview;
            this.SelectedTabColor = SelectedTabColor;
            this.NotSelectedTabColor = NotSelectedTabColor;

            MyMultiview.ActiveViewIndex = 0;

        }

        public void AddTab(LinkButton MyLinkButton)
        {
            if(!Tabs.ContainsKey(MyLinkButton))
            {
                int TabsCount = Tabs.Count;

                if(TabsCount == 0)
                {
                    MyLinkButton.BackColor = SelectedTabColor;
                }

                Tabs.Add(MyLinkButton, TabsCount);

                MyLinkButton.Click += new System.EventHandler(LinkButton_Click);

            }

        }

        private void LinkButton_Click(object sender, EventArgs e)
        {
            LinkButton ClickedLinkButton = (LinkButton)sender;
            MyMultiview.ActiveViewIndex = (int)Tabs[ClickedLinkButton];

            foreach (LinkButton LinkButton in Tabs.Keys)
            {

                if(LinkButton  ==    ClickedLinkButton)
                {

                    LinkButton.BackColor = SelectedTabColor;

                }
                else
                {

                    LinkButton.BackColor = NotSelectedTabColor;
                }
                
            }

        }




    }
}