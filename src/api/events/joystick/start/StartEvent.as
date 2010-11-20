package api.events.joystick.start
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class StartEvent extends JoystickEvent
	{
		
		public function StartEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : StartEvent = new StartEvent( type );
			return e;
		}
	}
}