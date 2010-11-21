package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnProgressEvent extends BrowserEvent
	{
		/**
	* The OnProgressEvent.STATUS constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>status</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>bytesLoaded</td><td>0</td></tr>
	* 
	* <tr><td>bytesTotal</td><td>0</td></tr>
	* 
	* </table>
	*
	* @eventType status
	*/
		public static const STATUS:String = "status";
		
		public var bytesLoaded:Number = 0;
		public var bytesTotal:Number = 0;
		
		public function OnProgressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnProgressEvent = new OnProgressEvent( type );
			e.bytesLoaded = bytesLoaded;
			e.bytesTotal = bytesTotal;
			return e;
		}
	}
}