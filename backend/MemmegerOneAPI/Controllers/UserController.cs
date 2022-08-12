using MemmegerOneAPI.DataDB;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;


namespace MemmegerOneAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        Memmeger_DBContext _DBContext = new Memmeger_DBContext();

        [HttpGet]
        public async Task<ActionResult<List<TestTable>>> Get()
        {
            return Ok(_DBContext.TestTables);
        }

        /* [HttpGet("{nutzerId}")]
        public async Task<ActionResult<TestTable>> Get(string nutzerId)
        {
            //var testTable = _DBContext.TestTables.Where(f => f.NutzerId == nutzerId); 
            //if (testTable == null)
            //    return BadRequest("User not found.");

            var user = await _DBContext.TestTables.FindAsync(nutzerId);
            if (user == null)
                return BadRequest("User not found.");

            return Ok(user);
        } */ 

        [HttpGet("{password}")]
        public async Task<ActionResult<TestTable>> Get(string password)
        {
            var testTable = _DBContext.TestTables.Where(f => f.Password == password); 
            if (testTable == null)
                return BadRequest("User not found.");

            /* var user = await _DBContext.TestTables.FindAsync(nutzerId);
            if (user == null)
                return BadRequest("User not found."); */

            return Ok(testTable);
        }

        [HttpPost]
        public async Task<ActionResult<List<TestTable>>> AddUser(TestTable user)
        {
            _DBContext.TestTables.Add(user);
            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.TestTables.ToListAsync());
        }

        [HttpPut]
        public async Task<ActionResult<List<TestTable>>> UpdateUser(TestTable request)
        {
            var user = await _DBContext.TestTables.FindAsync(request.NutzerId);
            if (user == null)
                return BadRequest("User not found.");

            user.Benutzername = request.Benutzername;
            user.Password = request.Password;

            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.TestTables.ToListAsync());
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<List<TestTable>>> Delete(string id)
        {
            var user = await _DBContext.TestTables.FindAsync(id);
            if (user == null)
                return BadRequest("User not found.");

            _DBContext.TestTables.Remove(user);

            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.TestTables.ToListAsync());
        }
    }
}
