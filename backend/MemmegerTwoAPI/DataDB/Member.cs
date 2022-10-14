using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace MemmegerTwoAPI.DataDB
{
    public partial class Member
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

        [ForeignKey("EventId")]
        [InverseProperty("Members")]
        public virtual Event Event { get; set; } = null!;
        [ForeignKey("UserId")]
        [InverseProperty("Members")]
        public virtual User User { get; set; } = null!;
    }
}
