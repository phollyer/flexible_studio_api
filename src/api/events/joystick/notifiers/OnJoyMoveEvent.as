package api.events.joystick.notifiers
{
	import flash.events.Event;
	
	import api.events.joystick.JoystickEvent;

	public class OnJoyMoveEvent extends JoystickEvent
	{
		public static const COMPLETE:String = "complete";
		public static const CHANGE:String = "change";
		
		public var id:String = null;
		public var pov:Number = -1;
		public var rudder:Number = -1;
		public var uAxis:Number = -1;
		public var vAxis:Number = -1;
		public var xAxis:Number = -1;
		public var yAxis:Number = -1;
		public var zAxis:Number = -1;
		
		public function OnJoyMoveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnJoyMoveEvent = new OnJoyMoveEvent( type );
			e.id = id;
			e.pov = pov;
			e.rudder = rudder;
			e.uAxis = uAxis;
			e.vAxis = vAxis;
			e.xAxis = xAxis;
			e.yAxis = yAxis;
			e.zAxis = zAxis;
			return e;
		}
	}
}