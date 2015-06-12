// -----------------------------------------------------------------------
// <copyright file="ActivityRepository.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Sportzly.Repository
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using Sportzly.DataAccess;
    using Sportzly.BusinessEntities.BusinessEntity;
    using Sportzly.Framework;
    using System.Net;
    using System.IO;

    /// <summary>
    /// TODO: Update summary.
    public class ActivityRepository
    {    /// </summary>

        public IList<ActivityEntity> UpdateStatus(long userId, string statusMessage, Nullable<long> parentId, bool isPublic, long teamId, long eventId)
        {
            using (var context = new SportzlyDataContext())
            {
                //if (teamId > 0)
                //{
                //    var team = context.Teams.Where(rs => rs.OwnerId == userId ||
                //        rs.TeamMembers.Any(rs1 => rs1.UserId.Value == userId && rs1.IsApproved.HasValue && rs1.IsApproved.Value));

                //    team = team.Where(rs => rs.Id == teamId);

                //    if (!team.Any())
                //        throw new Exception("You are not member of this team yet. Please join to post messages to this team");
                //}

                var result = context.Activities;

                var activity = new Activity()
                {
                    Description = statusMessage,
                    PostDate = DateTime.Now,
                    IsActive = true,
                    IsPublic = isPublic,
                    ParentActivityId = parentId,
                    OwnerId = Convert.ToDecimal(userId)
                };

                if (eventId > 0)
                {
                    activity.EventId = eventId;
                }


                result.AddObject(activity);

                context.SaveChanges();

                if (teamId > 0)
                {
                    context.ActivityTeams.AddObject(new ActivityTeam() { TeamId = teamId, ActivityId = activity.Id });
                    context.SaveChanges();
                    var ownerEmail = CommonRepository.GetEmailByID(Convert.ToInt64(context.Teams.Where(i => i.Id == teamId).FirstOrDefault().OwnerId));
                    var members = context.Teams.FirstOrDefault(rs => rs.Id == teamId).TeamMembers.Where(i => i.IsApproved.Value == true);
                    var user = context.Users.First(rs => rs.Id == userId);
                    var memberUsers = (from m in members join u in context.Users on m.UserId equals u.Id select u.Email).ToList();
                    MailUtils.SendPostNotificationMessage(memberUsers, CommonRepository.GetTeamNameByID(teamId), CommonRepository.GetNameByID(userId), "message", "team.aspx?" + teamId.ToString(), ownerEmail, statusMessage, user.GetProfilePhoto());
                }
                else
                {
                    var members = context.Friends.Where(i => i.IsApproved.Value == true && i.UserId == userId);
                    var memberUsers = (from m in members join u in context.Users on m.FriendId equals u.Id select u.Email).ToList();
                    var membersF = context.Friends.Where(i => i.IsApproved.Value == true && i.FriendId == userId);
                    var memberUsersF = (from m in membersF join u in context.Users on m.UserId equals u.Id select u.Email).ToList();
                    var user = context.Users.First(rs => rs.Id == userId);
                    MailUtils.SendFriendPostNotificationMessage(memberUsers, CommonRepository.GetNameByID(userId), "message", "myupdates.aspx", statusMessage, user.GetProfilePhoto());
                    MailUtils.SendFriendPostNotificationMessage(memberUsersF, CommonRepository.GetNameByID(userId), "message", "myupdates.aspx", statusMessage, user.GetProfilePhoto());
                }


                return EntityMapper.MapList<Activity, ActivityEntity>(activity);
            }

        }


        public IList<FeedEntity> GetFeed(int sportId)
        {
            using (var context = new SportzlyDataContext())
            {
                var f = context.Feeds.Where(i => i.FeedSport == sportId).FirstOrDefault();
                var Feeds = context.FeedContents.AsQueryable();
                Feeds = Feeds.Where(i => i.FeedId == f.Id && i.Image !="").OrderByDescending(i => i.PublishedDate).Take(20);
                return EntityMapper.MapList<FeedContent, FeedEntity>(Feeds.ToList());
            }
        }

        public List<DocumentEntity> GetDocuments(long teamId)
        {
            var lst = new List<DocumentEntity>();
            using (var context = new SportzlyDataContext())
            {
                var result = (from d in context.DocumentTitles
                              where d.TeamId == teamId
                              orderby d.CreatedDate descending
                              select d).Take(4).AsEnumerable().Select(i => new DocumentEntity
                              {
                                  title = i.Title,
                                  Id = i.Id,
                                  postdate = i.CreatedDate.ToString("MM.dd.yyyy"),
                                  Files = context.DocFiles.Where(j => j.DocTitleId == i.Id).OrderBy(j => j.FileName).Select(j => new FileEntity { filename = j.FileName, filepath = j.UrlPath }).ToList()
                              });

                return result.ToList();
            }
        }

        public List<DocumentEntity> GetAllDocuments(long teamId)
        {
            var lst = new List<DocumentEntity>();
            using (var context = new SportzlyDataContext())
            {
                var result = (from d in context.DocumentTitles
                              where d.TeamId == teamId
                              orderby d.CreatedDate descending
                              select d).AsEnumerable().Select(i => new DocumentEntity
                              {
                                  title = i.Title,
                                  Id = i.Id,
                                  postdate = i.CreatedDate.ToString("MM.dd.yyyy"),
                                  Files = context.DocFiles.Where(j => j.DocTitleId == i.Id).OrderBy(j => j.FileName).Select(j => new FileEntity { filename = j.FileName, filepath = j.UrlPath }).ToList()
                              });

                return result.ToList();
            }
        }

        public List<DocumentEntity> SaveDocuments(long userId, string statusMessage, string files, string title, bool isPublic, long teamId, string names)
        {
            var lst = new List<DocumentEntity>();
            using (var context = new SportzlyDataContext())
            {
                var docTitle = CommonRepository.CreateDocTitle(userId, title, context, statusMessage, teamId);
                if (docTitle.Id > 0)
                {
                    CommonRepository.SaveFiles(userId, docTitle.Id, context, files, names);
                    var result = context.Activities;
                    var activity = new Activity()
                    {
                        Description = statusMessage,
                        PostDate = DateTime.Now,
                        IsActive = true,
                        DocumentId = docTitle.Id,
                        IsPublic = isPublic,
                        OwnerId = Convert.ToDecimal(userId)
                    };

                    if (teamId > 0)
                    {
                        activity.ActivityTeams.Add(new ActivityTeam() { TeamId = teamId });
                        var ownerEmail = CommonRepository.GetEmailByID(Convert.ToInt64(context.Teams.Where(i => i.Id == teamId).FirstOrDefault().OwnerId));
                        var members = context.Teams.FirstOrDefault(rs => rs.Id == teamId).TeamMembers.Where(i => i.IsApproved.Value == true);
                        var memberUsers = (from m in members join u in context.Users on m.UserId equals u.Id select u.Email).ToList();
                        var user = context.Users.First(rs => rs.Id == userId);
                        MailUtils.SendPostNotification(memberUsers, CommonRepository.GetTeamNameByID(teamId), CommonRepository.GetNameByID(userId), "document", "team.aspx?" + teamId.ToString(), ownerEmail,user.GetProfilePhoto());
                    }
                    else
                    {
                        var members = context.Friends.Where(i => i.IsApproved.Value == true && i.UserId == userId);
                        var memberUsers = (from m in members join u in context.Users on m.FriendId equals u.Id select u.Email).ToList();
                        var membersF = context.Friends.Where(i => i.IsApproved.Value == true && i.FriendId == userId);
                        var memberUsersF = (from m in membersF join u in context.Users on m.UserId equals u.Id select u.Email).ToList();
                        var user = context.Users.First(rs => rs.Id == userId);
                        MailUtils.SendFriendPostNotification(memberUsers, CommonRepository.GetNameByID(userId), "message", "myupdates.aspx", user.GetProfilePhoto());
                        MailUtils.SendFriendPostNotification(memberUsersF, CommonRepository.GetNameByID(userId), "message", "myupdates.aspx", user.GetProfilePhoto());
                    }
                    result.AddObject(activity);
                    context.SaveChanges();


                    lst.Add(new DocumentEntity { Id = docTitle.Id });

                }
            }
            return lst;
        }

        public IList<ActivityEntity> SaveAlbumMessage(long userId, string statusMessage, long[] imageIds, string albumName, bool isPublic, long teamId, long albumId)
        {
            using (var context = new SportzlyDataContext())
            {
                var album = CommonRepository.GetOrCreateAlbum(userId, albumName, context, albumId);

                context.AlbumPhotos.Where(rs => imageIds.Contains(rs.Id)).ToList().ForEach(rs => rs.Album = album);
                context.SaveChanges();

                var result = context.Activities;

                var activity = new Activity()
                {
                    Description = statusMessage,
                    PostDate = DateTime.Now,
                    IsActive = true,
                    Album = album,
                    IsPublic = isPublic,
                    OwnerId = Convert.ToDecimal(userId)
                };

                if (teamId > 0)
                {
                    activity.ActivityTeams.Add(new ActivityTeam() { TeamId = teamId });
                    var ownerEmail = CommonRepository.GetEmailByID(Convert.ToInt64(context.Teams.Where(i => i.Id == teamId).FirstOrDefault().OwnerId));
                    var members = context.Teams.FirstOrDefault(rs => rs.Id == teamId).TeamMembers.Where(i => i.IsApproved.Value == true);
                    var memberUsers = (from m in members join u in context.Users on m.UserId equals u.Id select u.Email).ToList();
                    var user = context.Users.First(rs => rs.Id == userId);
                    MailUtils.SendPostNotification(memberUsers, CommonRepository.GetTeamNameByID(teamId), CommonRepository.GetNameByID(userId), "picture", "team.aspx?" + teamId.ToString(), ownerEmail, user.GetProfilePhoto());
                }
                else
                {
                    var members = context.Friends.Where(i => i.IsApproved.Value == true && i.UserId == userId);
                    var memberUsers = (from m in members join u in context.Users on m.FriendId equals u.Id select u.Email).ToList();
                    var membersF = context.Friends.Where(i => i.IsApproved.Value == true && i.FriendId == userId);
                    var memberUsersF = (from m in membersF join u in context.Users on m.UserId equals u.Id select u.Email).ToList();
                    var user = context.Users.First(rs => rs.Id == userId);
                    MailUtils.SendFriendPostNotification(memberUsers, CommonRepository.GetNameByID(userId), "message", "myupdates.aspx", user.GetProfilePhoto());
                    MailUtils.SendFriendPostNotification(memberUsersF, CommonRepository.GetNameByID(userId), "message", "myupdates.aspx", user.GetProfilePhoto());
                }
                result.AddObject(activity);

                context.SaveChanges();



                var activities = EntityMapper.MapList<Activity, ActivityEntity>(activity);

                activities.ToList().ForEach(rs =>
                {
                    if (rs.Album != null && rs.Album.Photos != null)
                    {
                        rs.Album.Photos = rs.Album.Photos.Take(2).ToList();
                    }
                });

                return activities;
            }

        }


        public IList<ActivityEntity> GetActivities(int activityCount, Nullable<long> parentId, string userEmail, ActivityType activityType, long teamId, long eventId, long userId, out int resultCount)
        {
            int pageSize = 15;

            using (var context = new SportzlyDataContext())
            {
                var result = context.Activities.Where(rs => rs.IsActive);

                result = result.Where(rs => parentId.HasValue ? rs.ParentActivityId == parentId : rs.ParentActivityId == null);

                if (!string.IsNullOrEmpty(userEmail))
                    result = result.Where(rs => rs.User.Email == userEmail);

                switch (activityType)
                {
                    case ActivityType.All:
                        break;
                    case ActivityType.Photos:
                        result = result.Where(rs => rs.Album != null);
                        break;
                    case ActivityType.Videos:
                        result = result.Where(rs => rs.VideoId.HasValue);
                        break;
                    case ActivityType.Quotes:
                        result = result.Where(rs => rs.VideoId == null && rs.Album == null && rs.DocumentId == null);
                        break;
                    case ActivityType.Docs:
                        result = result.Where(rs => rs.DocumentId.HasValue);
                        break;
                }



                if (teamId > 0)
                {

                    var team = context.Teams.FirstOrDefault(rs => rs.Id == teamId
                        && (rs.OwnerId == userId || rs.TeamMembers.Any(rs1 => rs1.UserId == userId) || rs.TeamFollowers.Any(rs2 => rs2.UserId == userId)));

                    if (team != null)
                    {
                        result = result.Where(rs => rs.ActivityTeams.Count(rs1 => rs1.Team.Id == team.Id) > 0);
                    }
                    else
                    {
                        result = result.Where(rs => rs.Id == 0);
                    }
                }
                else if (eventId > 0)
                {
                    result = result.Where(rs => rs.EventId == eventId);
                }
                else
                {
                    if (parentId.HasValue) { }
                    else
                    {
                        var friends = context.Friends.Where(rs => (rs.FriendId == userId || rs.UserId == userId)
                            && rs.IsApproved.HasValue && rs.IsApproved.Value == true);
                        if (friends != null && friends.Count() > 0)
                        {
                            var friendsList = friends.Select(rs => rs.UserId);
                            var friendsList1 = friends.Select(rs => rs.FriendId);

                            var allUsers = friendsList.Concat(friendsList1).Distinct();
                            result = result.Where(rs => allUsers.Contains(rs.OwnerId));
                        }
                        else
                        {
                            result = result.Where(rs => rs.OwnerId == userId);
                        }
                    }
                }


                resultCount = result.Count();

                if (parentId.HasValue)
                    result = result.OrderBy(rs => rs.PostDate);
                else
                    result = result.OrderByDescending(rs => context.Activities.Where(k => k.ParentActivityId == rs.Id).FirstOrDefault() == null ? rs.PostDate : context.Activities.Where(k => k.ParentActivityId == rs.Id).OrderByDescending(l => l.PostDate).FirstOrDefault().PostDate)
                                .Skip(activityCount)
                                .Take(pageSize);



                var activities = EntityMapper.MapList<Activity, ActivityEntity>(result.ToList());

                activities.ToList().ForEach(rs => rs.ActivityType = ActivityType.Quotes);

                activities.ToList().ForEach(rs =>
                {
                    if (rs.Album != null && rs.Album.Photos != null)
                    {
                        rs.Album.Photos = rs.Album.Photos.Take(2).ToList();
                        rs.ActivityType = ActivityType.Photos;
                    }
                });
                activities.ToList().ForEach(rs =>
                {
                    if (rs.Doc != null)
                    {
                        rs.Doc.title = rs.Doc.title;
                        rs.Doc.Files = rs.Doc.Files.ToList();
                        rs.ActivityType = ActivityType.Docs;
                    }
                });
                activities.ToList().ForEach(rs => { if (rs.Video != null) rs.ActivityType = ActivityType.Videos; });

                return activities;
            }
        }



        public IList<CheersEntity> SetCheers(long userId, long activityId, bool isCheers)
        {
            using (var context = new SportzlyDataContext())
            {
                var result = context.ActivityCheers.AsQueryable();

                result = result.Where(rs => rs.UserId == userId);
                result = result.Where(rs => rs.ActivityId == activityId);

                if (result.Count() == 1)
                {
                    result.First().IsCheered = isCheers;
                }
                else
                {
                    ActivityCheer cheer = new ActivityCheer()
                    {
                        UserId = userId,
                        IsCheered = isCheers,
                        ActivityId = activityId,
                        ClickDate = DateTime.Now
                    };
                    context.ActivityCheers.AddObject(cheer);
                }

                context.SaveChanges();

                var activity = context.Activities
                                .Where(rs => rs.Id == activityId);


                return EntityMapper.MapList<Activity, CheersEntity>(activity.ToList());

            }
        }

        public void DeleteActivity(long? activityId)
        {
            using (var context = new SportzlyDataContext())
            {
                var activity = context.Activities.Where(rs => rs.Id == activityId.Value);
                if (activity.FirstOrDefault() != null)
                {
                    //context.Activities.DeleteObject(activity.FirstOrDefault());
                    activity.FirstOrDefault().IsActive = false;
                    context.SaveChanges();
                }
            }
        }

        public IList<ActivityEntity> SavePhotoComment(long userId, string statusMessage, long imageId, bool isPublic, long teamId)
        {
            using (var context = new SportzlyDataContext())
            {
                var albumId = context.AlbumPhotos.Where(rs => rs.Id == imageId).FirstOrDefault().AlbumId;
                var result = context.Activities;

                var activity = new Activity()
                {
                    Description = statusMessage,
                    PostDate = DateTime.Now,
                    IsActive = true,
                    PhotoId = albumId,
                    AlbumPhotoId = imageId,
                    IsPublic = isPublic,
                    OwnerId = Convert.ToDecimal(userId)
                };

                if (teamId > 0)
                {
                    activity.ActivityTeams.Add(new ActivityTeam() { TeamId = teamId });
                }

                result.AddObject(activity);

                context.SaveChanges();

                var to = "";
                var userowner = CommonRepository.GetOwnerAlbumNameByID(Convert.ToInt64(albumId.Value), ref to);
                var postUser = CommonRepository.GetNameByID(userId);
                var albumname = CommonRepository.GetAlbumNameByID(Convert.ToInt64(albumId.Value));
                var user = context.Users.First(rs => rs.Id == userId);
                try
                {
                    MailUtils.SendPostComment(to, userowner, postUser, albumname, statusMessage,user.GetProfilePhoto());
                }
                catch (Exception ex)
                {
                    MailUtils.SendExceptionMessage(ex.ToString());
                }



                var activities = EntityMapper.MapList<Activity, ActivityEntity>(activity);

                activities.ToList().ForEach(rs =>
                {
                    if (rs.Album != null && rs.Album.Photos != null)
                    {
                        rs.Album.Photos = rs.Album.Photos.Take(2).ToList();
                    }
                });

                return activities;
            }

        }


        public IList<ActivityEntity> GetPhotoComments(int activityCount, long teamId, long userId, long photoId, out int resultCount)
        {
            int pageSize = 15;

            using (var context = new SportzlyDataContext())
            {
                var result = context.Activities.Where(rs => rs.IsActive == true);

                result = result.Where(rs => rs.AlbumPhotoId == photoId);




                //if (teamId > 0)
                //{

                //    var team = context.Teams.FirstOrDefault(rs => rs.Id == teamId
                //        && (rs.OwnerId == userId || rs.TeamMembers.Any(rs1 => rs1.UserId == userId)));

                //    if (team != null)
                //    {
                //        result = result.Where(rs => rs.ActivityTeams.Count(rs1 => rs1.Team.Id == team.Id) > 0);
                //    }
                //    else
                //    {
                //        result = result.Where(rs => rs.Id == 0);
                //    }
                //}
                //else
                //{
                //    var friends = context.Friends.Where(rs => (rs.FriendId == userId || rs.UserId == userId)
                //        && rs.IsApproved.HasValue && rs.IsApproved.Value == true);

                //    var friendsList = friends.Select(rs => rs.UserId);
                //    var friendsList1 = friends.Select(rs => rs.FriendId);

                //    var allUsers = friendsList.Concat(friendsList1).Distinct();
                //    result = result.Where(rs => allUsers.Contains(rs.OwnerId));
                //}

                resultCount = result.Count();

                //result = result.OrderByDescending(rs => rs.PostDate)
                //            .Skip(activityCount)
                //            .Take(pageSize);



                var activities = EntityMapper.MapList<Activity, ActivityEntity>(result.ToList());

                return activities;
            }
        }

        public void DeletePhoto(long photoId)
        {
            using (var context = new SportzlyDataContext())
            {
                var activites = context.Activities.Where(i => i.DocumentId == photoId).ToList();
                for (int i = 0; i < activites.Count; i++)
                {
                    DeleteActivity(activites[i].Id);
                }

                var albumPhotos = context.AlbumPhotos.Where(rs => rs.Id == photoId);
                if (albumPhotos.FirstOrDefault() != null)
                {
                    context.DeleteObject(albumPhotos.FirstOrDefault());
                    context.SaveChanges();
                }
            }
        }



    }
}
