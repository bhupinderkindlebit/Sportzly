using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.Framework.Attributes;
using Sportzly.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sportzly.Web.Controls
{
    public partial class CreatePoll : BaseUserControl<CreatePoll>
    {
        PollQuery pollQuery = new PollQuery();
        PollEntity pollObj = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            var result = ApiMethods.GetMyTeams(CurrentUser.UserKey.ToString(), CurrentUser.Id);
            result.Results.ToList().ForEach(rs => this.teamList.Items.Add(new ListItem() { Text = rs.Value, Value = rs.Key }));

            var pollIdStr = Request.QueryString.Get("id");
            long pollId;

            long.TryParse(pollIdStr, out pollId);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "poll",
                      string.Format(" var pollId = '{0}';", pollId), true);

            if (Page.IsPostBack)
            {
                SavePoll(pollId);
            }

            else
            {

            }
        }

        private void LoadPoll(long pollId)
        {
            var result = ApiMethods.GetPollData(pollId, CurrentUser.UserKey.ToString());
            pollObj = result.Results.FirstOrDefault();
            if (pollObj != null)
            {
                this.pollQuestion.Value = pollObj.PollQuestion;
                //this.dateExpiry.Value = pollObj.PollExpiry.ToShortDateString();
                //this.chActive.Checked = pollObj.PollActive;

                //pollObj.PollOptions.ForEach(rs => ddlOptions.Items.Add(new ListItem()
                //{
                //    Text = rs.OptionDetails,
                //    Value = rs.OptionId.ToString()
                //}));
            }
        }

        public void SavePoll(long pollId)
        {
            // var d = this.dateExpiry.Value + " 12:00:00";
            DateTime pollExpiry = System.DateTime.Now.AddDays(2).Date;
            bool IsActive = true;
            string Question = this.pollQuestion.Value;
            var answers = new List<string>();
            //foreach (var opt in hdAwards.Value.Trim(';').Split(';'))
            //{
            //    answers.Add(opt);
            //}

            answers.Add("Yes");
            answers.Add("No");
            pollQuery.Question = Question;
            pollQuery.Active = IsActive;
            pollQuery.Answers = answers;
            pollQuery.ExpiryDate = pollExpiry;
            pollQuery.PollId = pollId;
            pollQuery.TeamId = int.Parse(this.teamList.Value);
            //pollQuery.CompanyId = int.Parse(this.teamList.Value);
            HttpCookie cookie = Request.Cookies.Get("__sportzly");
            try
            {
                var result = ApiMethods.SavePoll(CurrentUser.UserKey.ToString(), pollQuery);
                pollObj = result.Results.FirstOrDefault();
                //if (pollObj.PollId != 0)
                //{
                successPanel.InnerText = "Poll is successfully created";
                errorPanel.InnerText = string.Empty;
                //}
            }
            catch (Exception ex)
            {
                successPanel.InnerText = string.Empty;
                errorPanel.InnerText = ex.Message;
                return;
            }
        }
    }
}