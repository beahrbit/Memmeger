using MemmegerOneAPI.DataDB;
using Microsoft.AspNetCore.Mvc;

namespace MemmegerOneAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EventController : Controller
    {
        Memmeger_DBContext _DBContext = new Memmeger_DBContext();

        [HttpGet]
        public async Task<ActionResult<List<TestTable>>> Get()
        {
            return Ok(_DBContext.TestTables);
        }
    }
}
