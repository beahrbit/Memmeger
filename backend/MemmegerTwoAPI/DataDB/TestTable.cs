using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace MemmegerTwoAPI.DataDB
{
    [Table("TestTable")]
    public partial class TestTable
    {
        [StringLength(500)]
        [Unicode(false)]
        public string? Benutzername { get; set; }
        [StringLength(500)]
        [Unicode(false)]
        public string? Password { get; set; }
        [Key]
        [Column("NutzerID")]
        [StringLength(500)]
        [Unicode(false)]
        public string NutzerId { get; set; } = null!;
    }
}
