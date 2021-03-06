using gullycricket.Backbone;
using gullycricket.ModalClasses;
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
    public partial class CreateTeam : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            MessageBox.ClearMessage();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string teamtNameValue = teamName.Value.Trim();
                if (teamtNameValue == "")
                {
                    MessageBox.ErrorMessage("Kindly provide team name");
                    return;
                }
                TeamInfo oTeam = new TeamInfo();
                oTeam.TeamName = teamtNameValue;
                oTeam.UserId = SessionService.GetCurrentUser().oUser.Id;
                new TeamManagement().CreateTeam(oTeam);
                MessageBox.SuccessMessage("Team created");
                teamName.Value = "";
            }
            catch (Exception ex)
            {

                MessageBox.ErrorMessage(ex.Message);
            }
        }
    }
}