using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sportzly.BusinessEntities.BusinessEntity;
using Sportzly.BusinessEntities.QueryEntity;
using Sportzly.DataAccess;
using Sportzly.Framework;
using System.Text.RegularExpressions;

namespace Sportzly.Repository
{
    public class CommonRepository
    {

        public IList<KeyValueEntity> GetKeyValue(KeyValueType keyValueType, string searchString)
        {

            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                IQueryable<KeyValueEntity> result = null;
                switch (keyValueType)
                {
                    case KeyValueType.Countries:
                        //result = context.Localities
                        //                .Select(rs => new KeyValueEntity() { Key = rs.Country, Value = rs.Country });
                        List<KeyValueEntity> countries = GetCountries();
                        result = countries.AsQueryable();
                        break;
                    case KeyValueType.Cities:

                        result = context.Localities
                                        .Select(rs => new KeyValueEntity() { Key = rs.City, Value = rs.City });
                        break;
                    case KeyValueType.Groups:

                        result = context.Groups
                                    .Select(rs => new KeyValueEntity() { Key = rs.Name, Value = rs.Name });
                        break;
                    case KeyValueType.Sports:

                        //result = context.Sports
                        //            .Select(rs => new KeyValueEntity() { Key = rs.Id.ToString(), Value = rs.Name });

                        List<KeyValueEntity> sports = GetSports();
                        result = sports.AsQueryable();

                        break;
                    case KeyValueType.Teams:
                        result = context.Teams
                                    .Select(rs => new KeyValueEntity() { Key = rs.TeamName, Value = rs.TeamName });
                        break;
                    case KeyValueType.Levels:

                        List<KeyValueEntity> levels = GetLevels();
                        result = levels.AsQueryable();
                        break;

                    case KeyValueType.Roles:

                        List<KeyValueEntity> roles = GetRoles();
                        result = roles.AsQueryable();
                        break;

                    case KeyValueType.Carrier:

                        List<KeyValueEntity> carrier = GetCarriers();
                        result = carrier.AsQueryable();
                        break;
                }

                if (string.IsNullOrEmpty(searchString.Trim()))
                    result = result.Distinct();
                else
                    result = result.Where(rs => rs.Value.Contains(searchString)).Distinct();

                return result.ToList();

            }

            return null;
        }

        public string[] ExtractEmailAddressesFromString(string source)
        {
            MatchCollection mc = default(MatchCollection);
            int i = 0;
            mc = Regex.Matches(source, "([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})");
            string[] results = new string[mc.Count];
            for (i = 0; i <= results.Length - 1; i++)
            {
                results[i] = mc[i].Value.Trim();
            }

            return results;
        }

        private static List<KeyValueEntity> GetRoles()
        {
            List<KeyValueEntity> list = new List<KeyValueEntity>();
            string[] items = new string[] { "", "Athlete", "Coach", "Referee", "Athletic Director", "Owner", "Cheerleader", "Sports Medicine", "Physio", "Parent", "Grandparent", "Fan", "League Admin", "Organization Admin", "Marketing", "Press", "Personal Trainer", "Program Coordinator" };

            items.OrderBy(i => i).ToList().ForEach(rs => list.Add(new KeyValueEntity() { Key = rs, Value = rs }));

            return list;
        }
        private static List<KeyValueEntity> GetCarriers()
        {
            List<KeyValueEntity> list = new List<KeyValueEntity>();
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                list = context.Carriers.Where(i => i.IsActive == true).OrderBy(i => i.Carrier_Name).AsEnumerable().Select(j => new KeyValueEntity
                {
                    Key = j.Carrier_Name,
                    Value = string.Format("{0}", j.Carrier_id_pk)
                }).ToList();
            }
            list.Insert(0, new KeyValueEntity { Key = "Select Carrier", Value = "" });
            return list;
        }
        private static List<KeyValueEntity> GetSports()
        {
            List<KeyValueEntity> list = new List<KeyValueEntity>();
            string[] items = new string[] { "", "Action sports", "Football", "Badminton", "Baseball", "Basketball", "Fishing", "canoeing", "Cricket", "Cycling", "Figure Skating", "Golf", "Gymnastics", "Hockey", "Horse Racing", "Ice Hockey", "Ice Skating", "Karate", "Lacross", "Martial Arts", "Nascar", "Ping Pong", "Poker", "Rugby", "Skating", "Skiing", "Soccer", "Squash", "Swimming", "Swimming Track", "Tennis", "Volleyball", "Water Polo", "Yoga", "Wrestling", "Weightlifting", "Surfing", "Snowboarding", "Skateboarding", "Shooting", "Sailing", "Rowing", "Racquetball", "Motorsports", "Kayaking", "Field Hockey", "Hunting", "Fencing", "Cross Country", "Climbing", "Cheerleading", "Boxing", "Bowling", "Archery", "Zumba", "Cross Fit", "Ujam", "Insanity", "Jazzercise", "Pilates", "Cardio", "Kickboxing", "Koga", "Spin", "Cardio Jam", "Taebo", "Step Aerobics", "Aqua Fit", "Silver Sneakers (Seniors)", "P90X", "TRX Equipment", "Body Pump", "Body Combat", "Track and Field", "Road Running", "Race Walking","Softball" };

            items.OrderBy(i => i).ToList().ForEach(rs => list.Add(new KeyValueEntity() { Key = rs, Value = rs }));
            return list;
        }

        private static List<KeyValueEntity> GetLevels()
        {
            List<KeyValueEntity> list = new List<KeyValueEntity>();
            string[] items = new string[] { "", "Professional", "College", "High School", "Middle School", "Junior Under 13", "Amateur", "Casual", "Recreational", "Competitive", "Little league", "Varsity", "Junior Varsity", "Freshman" };

            items.OrderBy(i => i).ToList().ForEach(rs => list.Add(new KeyValueEntity() { Key = rs, Value = rs }));


            return list;
        }

        private static List<KeyValueEntity> GetCountries()
        {
            List<KeyValueEntity> list = new List<KeyValueEntity>();
            string[] items = new string[] { "Afghanistan", "Aland Islands", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia, Plurinational State of", "Bonaire, Sint Eustatius and Saba", "Bosnia and Herzegovina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, The Democratic Republic of The", "Cook Islands", "Costa Rica", "Cote D'ivoire", "Croatia", "Cuba", "Curacao", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-bissau", "Guyana", "Haiti", "Heard Island and Mcdonald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran, Islamic Republic of", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macao", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Palestinian Territory, Occupied", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Barthelemy", "Saint Helena, Ascension and Tristan da Cunha", "Saint Kitts and Nevis", "Saint Lucia", "Saint Martin (French part)", "Saint Pierre and Miquelon", "Saint Vincent and The Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Sint Maarten (Dutch part)", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and The South Sandwich Islands", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard and Jan Mayen", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Timor-leste", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela, Bolivarian Republic of", "Viet Nam", "Virgin Islands, British", "Virgin Islands, U.S.", "Wallis and Futuna", "Western Sahara", "Yemen", "Zambia", "Zimbabwe" };

            items.OrderBy(i => i).ToList().ForEach(rs => list.Add(new KeyValueEntity() { Key = rs, Value = rs }));
            list.Insert(0, new KeyValueEntity { Key = "", Value = "" });
            list.Insert(1, new KeyValueEntity { Key = "United States", Value = "United States" });
            return list;
        }

        public IList<ImageEntity> UploadImage(string fileName, long? userId, string albumName, long teamId, long albumId = -1)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var album = GetOrCreateAlbum(userId, albumName, context, albumId);

                var albumPhoto = new DataAccess.AlbumPhoto() { OwnerId = userId.Value, PostDate = DateTime.Now, UrlPath = fileName, TeamId = teamId };

                //album.AlbumPhotos.Add(albumPhoto);

                context.AlbumPhotos.AddObject(albumPhoto);

                albumPhoto.Album = album;

                context.SaveChanges();

                var result = context.AlbumPhotos.Where(rs => rs.Id == albumPhoto.Id);



                return EntityMapper.MapList<AlbumPhoto, ImageEntity>(result.ToList());
            }

        }

        internal static Album GetOrCreateAlbum(long? userId, string albumName, SportzlyDataContext context, long albumId)
        {
            var album = new Album();

            if (albumId > 0)
            {
                album = context.Albums.Where(rs => rs.Id == albumId && rs.OwnerId == userId.Value).FirstOrDefault();
            }
            else
            {
                album = context.Albums.Where(rs => rs.AlbumName == albumName && rs.OwnerId == userId.Value).FirstOrDefault();
            }

            if (album == null)
            {
                album = new DataAccess.Album() { AlbumName = albumName, CreateDate = DateTime.Now, OwnerId = userId.Value };
                context.Albums.AddObject(album);
            }
            return album;
        }

        internal static DocumentTitle CreateDocTitle(long? userId, string Name, SportzlyDataContext context, string message, long teamId)
        {
            var doctitle = new DocumentTitle();

            doctitle = new DataAccess.DocumentTitle() { OwnerID = userId.Value, CreatedDate = DateTime.Now, Title = Name, IsPublic = true, Description = message, TeamId = teamId };
            context.DocumentTitles.AddObject(doctitle);
            context.SaveChanges();
            return doctitle;
        }

        internal static void SaveFiles(long? userId, long titleId, SportzlyDataContext context, string Files, string names)
        {
            var file = new DocFile();
            var arr = Files.Split(',');
            var n = names.Split(',');

            for (int i = 0; i < arr.Length; i++)
            {
                file = new DataAccess.DocFile() { OwnerId = userId.Value, PostDate = DateTime.Now, UrlPath = arr[i], FileName = n[i], DocTitleId = titleId };
                context.DocFiles.AddObject(file);
                context.SaveChanges();
            }

        }

        public IList<AlbumEntity> GetAlbumPhotos(long albumId)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                var result = context.Albums.Where(rs => rs.Id == albumId);



                return EntityMapper.MapList<Album, AlbumEntity>(result.ToList());
            }
        }

        public static string GetNameByID(long id)
        {
            using (var context = new SportzlyDataContext())
            {
                var user = context.Users.Where(i => i.Id == id).FirstOrDefault();
                return user.FirstName + " " + user.LastName;
            }

        }

        public static string GetEmailByID(long id)
        {
            using (var context = new SportzlyDataContext())
            {
                var user = context.Users.Where(i => i.Id == id).FirstOrDefault();
                return user.Email;
            }

        }

        public static string GetTeamNameByID(long id)
        {
            using (var context = new SportzlyDataContext())
            {
                var team = context.Teams.Where(i => i.Id == id).FirstOrDefault();
                return team.TeamName;
            }

        }

        public static string GetAlbumNameByID(long id)
        {
            using (var context = new SportzlyDataContext())
            {
                var album = context.Albums.Where(i => i.Id == id).FirstOrDefault();
                return album.AlbumName;
            }

        }

        public static string GetOwnerAlbumNameByID(long id, ref string email)
        {
            using (var context = new SportzlyDataContext())
            {
                var user = (from u in context.Users
                            join b in context.Albums on u.Id equals b.OwnerId
                            where b.Id == id
                            select u).ToList();
                email = user[0].Email;
                return user[0].FirstName + " " + user[0].LastName;

            }

        }


        public IList<ActivityEntity> UploadVideo(string videoId, string description, long? userId, long teamId)
        {
            using (var context = new Sportzly.DataAccess.SportzlyDataContext())
            {
                Activity activity = new Activity()
                {
                    Description = "New video uploaded",
                    PostDate = DateTime.Now,
                    IsActive = true,
                    IsPublic = true,
                    OwnerId = userId.Value
                };

                activity.Video = new Video()
                {
                    Description = description,
                    YoutubeId = videoId,
                    IsPublic = true,
                    OwnerId = userId.Value,
                    PostDate = DateTime.Now
                };

                context.Activities.AddObject(activity);
                context.SaveChanges();

                if (teamId > 0)
                {
                    context.ActivityTeams.AddObject(new ActivityTeam() { TeamId = teamId, ActivityId = activity.Id });
                    context.SaveChanges();
                    var ownerEmail = CommonRepository.GetEmailByID(Convert.ToInt64(context.Teams.Where(i => i.Id == teamId).FirstOrDefault().OwnerId));
                    var members = context.Teams.FirstOrDefault(rs => rs.Id == teamId).TeamMembers.Where(i => i.IsApproved.Value == true);
                    var memberUsers = (from m in members join u in context.Users on m.UserId equals u.Id select u.Email).ToList();
                    var user = context.Users.First(rs => rs.Id == userId);
                    MailUtils.SendPostNotification(memberUsers, GetTeamNameByID(teamId), GetNameByID(userId.Value), "video", "team.aspx?" + teamId.ToString(), ownerEmail,user.GetProfilePhoto());
                }
                else
                {
                    var members = context.Friends.Where(i => i.IsApproved.Value == true && i.UserId == userId);
                    var memberUsers = (from m in members join u in context.Users on m.FriendId equals u.Id select u.Email).ToList();
                    var membersF = context.Friends.Where(i => i.IsApproved.Value == true && i.FriendId == userId);
                    var memberUsersF = (from m in membersF join u in context.Users on m.UserId equals u.Id select u.Email).ToList();
                    var user = context.Users.First(rs => rs.Id == userId);
                    MailUtils.SendFriendPostNotification(memberUsers, GetNameByID(userId.Value), "video", "myupdates.aspx", user.GetProfilePhoto());
                    MailUtils.SendFriendPostNotification(memberUsersF, GetNameByID(userId.Value), "video", "myupdates.aspx", user.GetProfilePhoto());
                }



                return EntityMapper.MapList<Activity, ActivityEntity>(activity);

            }
        }
    }
}
