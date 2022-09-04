using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace MemmegerOneAPI.DataDB
{
    public partial class Event
    {
        public Event()
        {
            Members = new HashSet<Member>();
        }

        [Key]
        [Column("Event_Id")]
        [StringLength(200)]
        [Unicode(false)]
        public string EventId { get; set; } = null!;
        [Unicode(false)]
        public string? Title { get; set; }
        [Column(TypeName = "date")]
        public DateTime? Date { get; set; }
        [Unicode(false)]
        public string? Location { get; set; }
        [Unicode(false)]
        public string? Description { get; set; }
        [Column("Entry_Code")]
        [Unicode(false)]
        public string? EntryCode { get; set; }
        [Column("Entry_Link")]
        [Unicode(false)]
        public string? EntryLink { get; set; }

        [InverseProperty("Event")]
        public virtual ICollection<Member>? Members { get; set; }
    }
}
