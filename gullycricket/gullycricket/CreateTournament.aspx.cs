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
    public partial class CreateTournament : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            MessageBox.ClearMessage();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string tournamentNameValue = tournamentName.Value.Trim();
                if(tournamentNameValue == "")
                {
                    MessageBox.ErrorMessage("Kindly provide tournament name");
                    return;
                }
                TournamentInfo oTournament = new TournamentInfo();
                oTournament.TournamentName = tournamentNameValue;
                oTournament.UserId = SessionService.GetCurrentUser().oUser.Id;
                new TournamentManagement().CreateTournament(oTournament);
                MessageBox.SuccessMessage("Tournament created");
                tournamentName.Value = "";
            }
            catch (Exception ex)
            {

                MessageBox.ErrorMessage(ex.Message);
            }
        }
    }
}