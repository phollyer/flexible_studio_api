package api.events.ftp.notifiers
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class OnProgressEvent extends FtpEvent
	{
		
	/**
	* The OnProgressEvent.RESULT constant defines the value of the
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
	* The OnProgressEvent.STATUS constant defines the value of the
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
		
		public var bytesTransferred:Number = -1;
		
		public function OnProgressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnProgressEvent = new OnProgressEvent( type );
			e.bytesTransferred = bytesTransferred;
			return e;
		}
	}
}