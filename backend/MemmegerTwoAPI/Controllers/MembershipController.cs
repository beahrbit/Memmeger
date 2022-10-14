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
    public class MembershipController : ControllerBase
    {
        Memmeger_DBContext _DBContext = new Memmeger_DBContext();

        [HttpGet]
        public async Task<ActionResult<List<Member>>> Get()
        {
            return Ok(_DBContext.Members);
        }

        [HttpPost]
        public async Task<ActionResult<Event>> AddMembership(Member new_membership)
        {
            _DBContext.Members.Add(new_membership);
            await _DBContext.SaveChangesAsync();

            var result = await _DBContext.Members.Where(k => k.EventId == new_membership.EventId && k.UserId == new_membership.UserId).ToListAsync();
            if (!result.Any())
            {
                return BadRequest($"Membership between event({new_membership.EventId}) and user({new_membership.UserId}) could not be created");
            }

            return Ok(result);
        }

        [Route("{eventId}/{userId}")]
        [HttpDelete]
        public async Task<ActionResult<Member>> Delete(String eventId, String userId)
        {
            var membership = await _DBContext.Members.FirstOrDefaultAsync(k => k.EventId == eventId && k.UserId == userId);
            if (membership == null)
                return BadRequest("Event not found.");

            _DBContext.Members.Remove(membership);

            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.Members.ToListAsync());
        }
    }
}
