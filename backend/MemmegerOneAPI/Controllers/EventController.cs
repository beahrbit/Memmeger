using MemmegerOneAPI.DataDB;
using MemmegerOneAPI.Model;
using Microsoft.AspNetCore.Mvc;

namespace MemmegerOneAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EventController : ControllerBase
    {
        Memmeger_DBContext _DBContext = new Memmeger_DBContext();

        [HttpGet]
        public async Task<ActionResult<List<Event>>> Get()
        {
            return Ok(_DBContext.Events);
        }

        [Route("[action]")]
        [HttpGet]
        public async Task<ActionResult<Event>> GetEventById(string eventuuid)
        {
            var findevent = await _DBContext.Events.FindAsync(eventuuid);
            if (findevent == null)
                return BadRequest("Event not found.");

            return Ok(findevent);
        }

        [Route("[action]/{useruuid}")]
        [HttpGet]
        public async Task<ActionResult<List<Event>>> GetEventsOfUser(string useruuid)
        {
            List<Event> eventlist = new List<Event>();

            var eventuuids = await _DBContext.Members.Where(k => k.UserId == useruuid).ToListAsync();

            foreach(var item in eventuuids)
            {
                var tmpevent = await _DBContext.Events.FindAsync(item.EventId);
                if (tmpevent != null) 
                    eventlist.Add(tmpevent);
            }

            return Ok(eventlist);
        }

        [Route("[action]")]
        [HttpGet]
        public async Task<ActionResult<List<Eventuser>>> GetEventmemberByEventId(string eventuuid)
        {
            List<Eventuser> eventusers = new List<Eventuser>();
            var userlist = await _DBContext.Members.Where(k => k.EventId == eventuuid).ToListAsync();

            foreach(var item in userlist)
            {
                var tmpEventUser = new Eventuser(item);
                var tmpUser = await _DBContext.Users.FindAsync(item.UserId);

                if(tmpUser != null)
                    tmpEventUser.Username = tmpUser.Username;
                
                eventusers.Add(tmpEventUser);
            }

            return Ok(eventusers);
        }

        [HttpPost]
        public async Task<ActionResult<Event>> AddEvent(Event new_event)
        {
            new_event.EventId = await generateNewUUID();
            _DBContext.Events.Add(new_event);
            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.Events.FindAsync(new_event.EventId));
        }

        [HttpPut]
        public async Task<ActionResult<Event>> UpdateEvent(Event new_event)
        {
            var old_event = await _DBContext.Events.FindAsync(new_event.EventId);
            if (old_event == null)
                return BadRequest("Event not found.");

            old_event = new_event;

            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.Events.FindAsync(new_event.EventId));
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Event>> Delete(string id)
        {
            var del_event = await _DBContext.Events.FindAsync(id);
            if (del_event == null)
                return BadRequest("Event not found.");

            _DBContext.Events.Remove(del_event);

            await _DBContext.SaveChangesAsync();

            return Ok(await _DBContext.Events.ToListAsync());
        }
        private async Task<string> generateNewUUID()
        {
            while (true)
            {
                string uuid = Guid.NewGuid().ToString();
                if (await _DBContext.Events.FindAsync(uuid) == null)
                {
                    return uuid;
                }
            }
        }
    }

}
