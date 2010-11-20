package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnDeviceChangeEvent extends AppEvent
	{
		
    /**
    * The OnDeviceChangeEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>action</td><td>null</td></tr>
    * 
    * <tr><td>device</td><td>null</td></tr>
    * 
    * <tr><td>drive</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT : String = "result";
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