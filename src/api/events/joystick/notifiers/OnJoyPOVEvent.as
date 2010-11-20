package api.events.joystick.notifiers
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class OnJoyPOVEvent extends JoystickEvent
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		
		public var id:String = null;
		public var pov:Number = -1;
		
		public function OnJoyPOVEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnJoyPOVEvent = new OnJoyPOVEvent( type );
			return e;
		}
	}
}