package api.events.joystick.notifiers
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class OnJoyAnyButtonEvent extends JoystickEvent
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		
		public var button:Number = -1;
		public var id:String = null;
		public var state:Number = -1;
		
		public function OnJoyAnyButtonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnJoyAnyButtonEvent = new OnJoyAnyButtonEvent( type );
			e.button = button;
			e.id = id;
			e.state = state;
			return e;
		}
	}
}