package api.events.joystick.setThreshold
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class SetThresholdEvent extends JoystickEvent
	{
		
		public function SetThresholdEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetThresholdEvent = new SetThresholdEvent( type );
			return e;
		}
	}
}