package api.events.joystick.setPeriod
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class SetPeriodEvent extends JoystickEvent
	{
		
		public function SetPeriodEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPeriodEvent = new SetPeriodEvent( type );
			return e;
		}
	}
}