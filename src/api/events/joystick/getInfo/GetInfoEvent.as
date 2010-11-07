package api.events.joystick.getInfo
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class GetInfoEvent extends JoystickEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var info:XML = null;
		
		public function GetInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetInfoEvent = new GetInfoEvent( type );
			e.info = info;
			return e;
		}
	}
}