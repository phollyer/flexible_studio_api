package api.events.security.setExpiredFlag
{
	import flash.events.Event;
	
	import api.events.security.SecurityEvent;

	public class SetExpiredFlagEvent extends SecurityEvent
	{
		
		public function SetExpiredFlagEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetExpiredFlagEvent = new SetExpiredFlagEvent( type );
			return e;
		}
	}
}