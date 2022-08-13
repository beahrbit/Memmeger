using MemmegerOneAPI.DataDB;

namespace MemmegerOneAPI.Model
{
    public class Eventuser
    {
        public string? EventId { get; set; }
        public string? UserId { get; set; }
        public string? InvitationState { get; set; }
        public string? Role { get; set; }
        public string? Username { get; set; }

        public Eventuser(Member member)
        {
            EventId = member.EventId;
            UserId = member.UserId;
            InvitationState = member.InvitationState;  
            Role = member.Role;
        }
    }
}
