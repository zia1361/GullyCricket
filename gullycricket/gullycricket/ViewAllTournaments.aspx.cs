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
    public partial class ViewAllTournaments : BasePage
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
                TournamentRepeater.DataSource = new TournamentManagement().GetTournamentListByUserId(SessionService.GetCurrentUser().oUser.Id);
                TournamentRepeater.DataBind();
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
                int tournamentId = 0;
                int.TryParse(((LinkButton)sender).CommandArgument, out tournamentId);
                if(tournamentId == 0)
                {
                    throw new Exception("Invalid or no ID found");
                }
                new TournamentManagement().DeleteTournament(tournamentId);
                MessageBox.SuccessMessage("Tournament deleted successfully");
                BindData();
            }
            catch (Exception ex)
            {

                MessageBox.ErrorMessage(ex.Message);
            }
        }
    }
}