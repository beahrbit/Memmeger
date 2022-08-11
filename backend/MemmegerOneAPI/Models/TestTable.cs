using System;
using System.Collections.Generic;

namespace MemmegerOneAPI.Models
{
    public partial class TestTable
    {
        public string? Benutzername { get; set; }
        public string? Password { get; set; }
        public string NutzerId { get; set; } = null!;
    }
}
