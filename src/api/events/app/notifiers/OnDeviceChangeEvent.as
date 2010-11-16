package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnDeviceChangeEvent extends AppEvent
	{
		public static const RESULT:String = "result";
		
		public var action:String = null;
		public var device:String = null;
		public var drive:String = null;
		
		public function OnDeviceChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnDeviceChangeEvent = new OnDeviceChangeEvent( type );
			e.action = action;
			e.device = device;
			e.drive = drive;
			return e;
		}
	}
}