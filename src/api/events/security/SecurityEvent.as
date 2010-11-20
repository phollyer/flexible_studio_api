package api.events.security
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class SecurityEvent extends KernelEvent
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