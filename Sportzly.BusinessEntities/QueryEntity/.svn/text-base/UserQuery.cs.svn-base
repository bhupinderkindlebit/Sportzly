using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.Framework;
using Sportzly.BusinessEntities.BusinessEntity;

namespace Sportzly.BusinessEntities.QueryEntity
{
    public class UserQuery : BaseQuery
    {
        public string Token { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string EmailId { get; set; }
        public long TeamId { get; set; }
        public DateTime DOB { get; set; }
        public string ProfileData { get; set; }
        public string PasswordEnc { get { return Utility.Encrypt(this.Password); } }
        public string FacebookId { get; set; }
        public string TwitterId { get; set; }
        public string ProfilePic { get; set; }
    }

    public class CheckUserQuery : UserQuery
    {
        public string userEmailId { get; set; }
    }

    public class PlayerSearchQuery : BaseQuery
    {
        public string KeyWord { get; set; }
        public string Level { get; set; }
        public string Sports { get; set; }
        public string Location { get; set; }
        public string Email { get; set; }
        public string Message { get; set; }
        public long Id { get; set; }
        public long ParentId { get; set; }
        public long MemberId { get; set; }
        public PlayerDetailEntity Team { get; set; }
        public bool OptIn { get; set; }
        public int RecordsFrom { get; set; }
        public int RecordsCount { get; set; }
    }
}
