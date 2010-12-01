package api.events.splash.screen
{
	import flash.events.Event;
	
	import api.events.splash.SplashEvent;

	public class ScreenEvent extends SplashEvent
	{
		
	/**
	* The ScreenEvent.STATUS constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>status</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>data</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType status
	*/
		public static const RESULT:String = "result";
		
		public var data:String = null;
		
		public function ScreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ScreenEvent = new ScreenEvent( type );
			e.data = data;
			return e;
		}
	}
}