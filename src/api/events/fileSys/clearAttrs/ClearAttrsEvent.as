package api.events.fileSys.clearAttrs
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class ClearAttrsEvent extends FileSysEvent
	{
		/**
	* The ClearAttrsEvent.INVALID_ATTRS constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>invalidAttrs</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType invalidAttrs
	*/
		public static const INVALID_ATTRS:String = "invalidAttrs";
		
		public function ClearAttrsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearAttrsEvent = new ClearAttrsEvent( type );
			return e;
		}
	}
}