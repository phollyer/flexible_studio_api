package api.events.joystick.notifiers
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class OnJoyButtonMaskEvent extends JoystickEvent
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		
		public var id:String = null;
		public var mask:String = null;
		
		public function OnJoyButtonMaskEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnJoyButtonMaskEvent = new OnJoyButtonMaskEvent( type );
			e.id = id;
			e.mask = mask;
			return e;
		}
	}
}