package api.events.joystick
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class JoystickEvent extends SWFStudioEvent
	{
		public function JoystickEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : JoystickEvent = new JoystickEvent( type );
			return e;
		}
	}
}