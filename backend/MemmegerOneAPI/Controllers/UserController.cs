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

        [Route("[action]")]
        [HttpGet]
        public async Task<ActionResult<TestTable>> GetUserById(string useruuid)
        {
            var user = await _DBContext.Users.FindAsync(useruuid);
            if (user == null)
                return BadRequest("User not found.");

            return Ok(user);
        }

        [Route("[action]")]
        [HttpGet]
        public async Task<ActionResult<TestTable>> GetUserByPassword(string password)
        {
            var user = _DBContext.Users.Where(f => f.Password == password); 
            if (user == null)
                return BadRequest("User not found.");

            return Ok(user);
        }

        [HttpPost]
        public async Task<ActionResult<User>> AddUser(string username, string password)
        {
            Guid user_guid = Guid.NewGuid();
            string uuid_user = user_guid.ToString();

            User newUser = new User();
            newUser.UserId = uuid_user; 
            newUser.Username = username;
            newUser.Password = password;

            _DBContext.Users.Add(newUser);
            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.Users.FindAsync(uuid_user));
        }

        [HttpPut]
        public async Task<ActionResult<User>> UpdateUser(User new_user)
        {
            var old_user = await _DBContext.Users.FindAsync(new_user.UserId);
            if (old_user == null)
                return BadRequest("User not found.");

            old_user.Username = new_user.Username;
            old_user.Password = new_user.Password;

            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.Users.FindAsync(new_user.UserId));
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<List<TestTable>>> Delete(string id)
        {
            var user = await _DBContext.Users.FindAsync(id);
            if (user == null)
                return BadRequest("User not found.");

            _DBContext.Users.Remove(user);

            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.Users.ToListAsync());
        }
    }
}
