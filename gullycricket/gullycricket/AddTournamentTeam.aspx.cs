﻿using gullycricket.Model_Classes;
using gullycricket.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gullycricket
{
    public partial class AddTournamentTeam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int tournamentId = 0;
            int.TryParse(Request.QueryString["tId"], out tournamentId);
            if (tournamentId == 0)
            {
                Response.Redirect("pages-error-404.html");
            }
            MessageBox.ClearMessage();
            if (!IsPostBack)
            {
                var oUser = SessionService.GetCurrentUser().oUser;
                if (oUser == null)
                {
                    Response.Redirect("pages-error-404.html");
                }
                try
                {
                    new TeamManagement().BindTeams(TeamList);
                }
                catch (Exception ex)
                {

                    MessageBox.ErrorMessage(ex.Message);
                    return;
                }
                BindData();
            }
            

            
        }
        private void BindData()
        {
            try
            {
                int tournamentId = 0;
                int.TryParse(Request.QueryString["tId"], out tournamentId);
                TeamRepeater.DataSource = new TournamentManagement().GetTeamsByTournamentId(tournamentId);
                TeamRepeater.DataBind();
            }
            catch (Exception ex)
            {

                MessageBox.ErrorMessage(ex.Message);
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int tournamentId = 0;
                int.TryParse(Request.QueryString["tId"], out tournamentId);
                if (tournamentId == 0)
                {
                    Response.Redirect("pages-error-404.html");
                }

                int teamId = 0;
                int.TryParse(TeamList.SelectedValue, out teamId);
                if (teamId == 0)
                {
                    MessageBox.ErrorMessage("Kindly select team");
                    return;
                }

                new TournamentManagement().AddTournamentTeam(tournamentId, teamId);
                MessageBox.SuccessMessage("Team registered for this tournament");
                TeamList.SelectedValue = "0";
                BindData();
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
                new TournamentManagement().DeleteTournamentTeam(teamId);
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