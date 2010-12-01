package api.events.security
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class SecurityEvent extends SWFStudioEvent
	{
		public function SecurityEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SecurityEvent = new SecurityEvent( type );
			return e;
		}
	}
}