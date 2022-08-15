using System;
using System.Collections.Generic;

namespace MemmegerOneAPI.DataDB
{
    public partial class User
    {
        public string UserId { get; set; } = null!;
        public string? Username { get; set; }
        public string? Email { get; set; }
    }
}
