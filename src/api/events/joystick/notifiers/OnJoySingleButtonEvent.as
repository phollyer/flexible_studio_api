package api.events.joystick.notifiers
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class OnJoySingleButtonEvent extends JoystickEvent
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		
		public var id:String = null;
		public var state:Number = -1;
		
		public function OnJoySingleButtonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnJoySingleButtonEvent = new OnJoySingleButtonEvent( type );
			e.id = id;
			e.state = state;
			return e;
		}
	}
}