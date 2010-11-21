package api.events.tray.notifiers
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class OnTrayHoverEvent extends TrayEvent
	{
		/**
	* The OnTrayHoverEvent.STATUS constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>status</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType status
	*/
		public static const STATUS:String = "status";
		
		public function OnTrayHoverEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnTrayHoverEvent = new OnTrayHoverEvent( type );
			return e;
		}
	}
}