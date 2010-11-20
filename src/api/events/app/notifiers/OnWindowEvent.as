package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnWindowEvent extends AppEvent
	{
		
    /**
    * The OnWindowEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>caption</td><td>null</td></tr>
    * 
    * <tr><td>hwnd</td><td>null</td></tr>
    * 
    * <tr><td>windowClassName</td><td>null</td></tr>
    * 
    * <tr><td>windowStyle</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT : String = "result";
		public static const RESULT:String = "result";
		
		public var caption:String = null;
		public var hwnd:String = null;
		public var windowClassName:String = null;
		public var windowStyle:String = null;
		
		public function OnWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnWindowEvent = new OnWindowEvent( type );
			e.caption = caption;
			e.hwnd = hwnd;
			e.windowClassName = windowClassName;
			e.windowStyle = windowStyle;
			return e;
		}
	}
}