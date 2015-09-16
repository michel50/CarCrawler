using System;

namespace DataAccess.Entities
{
    public class Feed
    {
        public Int16 Id { get; set; }
        public string FeedCity { get; set; }
        public string FeedState { get; set; }
        public string FeedRssLink { get; set; }
        public bool FeedActive { get; set; }
    }
}
