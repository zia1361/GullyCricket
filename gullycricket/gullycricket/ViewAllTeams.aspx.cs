using gullycricket.Backbone;
using gullycricket.Model_Classes;
using gullycricket.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gullycricket
{
    public partial class ViewAllTeams : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MessageBox.ClearMessage();
            if (!IsPostBack)
            {
                
                BindData();
            }
            
            
        }

        private void BindData()
        {
            try
            {
                TeamRepeater.DataSource = new TeamManagement().GetTeamListByUserId(SessionService.GetCurrentUser().oUser.Id);
                TeamRepeater.DataBind();
            }
            catch (Exception ex)
            {

                MessageBox.ErrorMessage(ex.Message);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int teamId = 0;
                int.TryParse(((LinkButton)sender).CommandArgument, out teamId);
                if (teamId == 0)
                {
                    throw new Exception("Invalid or no ID found");
                }
                new TeamManagement().DeleteTeam(teamId);
                MessageBox.SuccessMessage("Team deleted successfully");
                BindData();
            }
            catch (Exception ex)
            {

                MessageBox.ErrorMessage(ex.Message);
            }
        }
    }
}