using MemmegerTwoAPI.DataDB;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MemmegerTwoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UserController : ControllerBase
    {
        Memmeger_DBContext _DBContext = new Memmeger_DBContext();

        [HttpGet]
        public async Task<ActionResult<List<User>>> Get()
        {
            return Ok(_DBContext.Users);
        }

        [Route("[action]")]
        [HttpGet]
        public async Task<ActionResult<User>> GetUserById(string useruuid)
        {
            var user = await _DBContext.Users.FindAsync(useruuid);
            if (user == null)
                return BadRequest("User not found.");

            return Ok(user);
        }

        [Route("[action]")]
        [HttpGet]
        public async Task<ActionResult<User>> GetUserByEmail(string email)
        {
            var userList = await _DBContext.Users.Where(f => f.Email == email).ToListAsync();
            if (userList == null || userList.Count != 1)
                return BadRequest("User not found.");

            return Ok(userList[0]);
        }

        [HttpPost]
        public async Task<ActionResult<User>> AddUser(User user)
        {
            user.UserId = await generateNewUUID();
            _DBContext.Users.Add(user);
            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.Users.FindAsync(user.UserId));
        }

        [HttpPut]
        public async Task<ActionResult<User>> UpdateUser(User new_user)
        {
            var old_user = await _DBContext.Users.FindAsync(new_user.UserId);
            if (old_user == null)
                return BadRequest("User not found.");

            old_user.Username = new_user.Username;
            old_user.Email = new_user.Email;

            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.Users.FindAsync(new_user.UserId));
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<List<User>>> Delete(string id)
        {
            var user = await _DBContext.Users.FindAsync(id);
            if (user == null)
                return BadRequest("User not found.");

            _DBContext.Users.Remove(user);

            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.Users.ToListAsync());
        }

        private async Task<string> generateNewUUID()
        {
            while (true)
            {
                string uuid = Guid.NewGuid().ToString();
                if (await _DBContext.Users.FindAsync(uuid) == null)
                {
                    return uuid;
                }
            }
        }
    }
}
