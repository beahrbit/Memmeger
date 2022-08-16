using System;
using System.Collections.Generic;

namespace MemmegerOneAPI.DataDB
{
    public partial class Member
    {
        public string EventId { get; set; } = null!;
        public string UserId { get; set; } = null!;
        public string? InvitationState { get; set; }
        public string? Role { get; set; }
    }
}
