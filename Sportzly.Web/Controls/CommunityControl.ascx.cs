using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.Web.Common;

namespace Sportzly.Web.Controls
{
    public partial class CommunityControl : BaseUserControl<CommunityControl>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public void BindCommunity(CommunityEntity community)
        {
            lblTeamNameHead.Text = community.CommunityName;
            lblDescription.Text = community.Description;
            lblFollowersCount.Text = community.FollowerCount.ToString();
            lblMembersCount.Text = community.MemberCount.ToString();
            lblCreateDate.Text = community.CreateDate.ToString();
            lblOwner.Text = community.OwnerName;
        }
    }
}