package api.events.joystick.stop
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class StopEvent extends JoystickEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function StopEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : StopEvent = new StopEvent( type );
			return e;
		}
	}
}