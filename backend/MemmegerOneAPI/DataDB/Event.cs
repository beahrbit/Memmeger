using System;
using System.Collections.Generic;

namespace MemmegerOneAPI.DataDB
{
    public partial class Event
    {
        public string EventId { get; set; } = null!;
        public string? Title { get; set; }
        public DateTime? Date { get; set; }
        public string? Location { get; set; }
        public string? Description { get; set; }
        public string? EntryCode { get; set; }
        public string? EntryLink { get; set; }
    }
}
