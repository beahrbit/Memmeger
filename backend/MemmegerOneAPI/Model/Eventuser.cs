using MemmegerOneAPI.DataDB;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MemmegerOneAPI.Model
{
    public class Eventuser
    {
        [Key]
        [Column("Event_Id")]
        [StringLength(200)]
        [Unicode(false)]
        public string EventId { get; set; } = null!;
        [Key]
        [Column("User_Id")]
        [StringLength(200)]
        [Unicode(false)]
        public string UserId { get; set; } = null!;
        [Column("Invitation_State")]
        [StringLength(200)]
        [Unicode(false)]
        public string? InvitationState { get; set; }
        [StringLength(200)]
        [Unicode(false)]
        public string? Role { get; set; }
        [StringLength(200)]
        [Unicode(false)]
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
