package api.events.fileSys.notifiers
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class OnCopyProgressEvent extends FileSysEvent
	{
		/**
	* The OnCopyProgressEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		/**
	* The OnCopyProgressEvent.STATUS constant defines the value of the
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
		
		public var bytesCopied:Number = -1;
		
		public function OnCopyProgressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnCopyProgressEvent = new OnCopyProgressEvent( type );
			e.bytesCopied = bytesCopied;
			return e;
		}
	}
}