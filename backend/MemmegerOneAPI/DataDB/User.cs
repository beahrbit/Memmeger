using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace MemmegerOneAPI.DataDB
{
    public partial class User
    {
        public User()
        {
            Members = new HashSet<Member>();
        }

        [Key]
        [Column("User_Id")]
        [StringLength(200)]
        [Unicode(false)]
        public string UserId { get; set; } = null!;
        [StringLength(200)]
        [Unicode(false)]
        public string? Username { get; set; }
        [StringLength(200)]
        [Unicode(false)]
        public string? Email { get; set; }

        [InverseProperty("User")]
        public virtual ICollection<Member>? Members { get; set; }
    }
}
