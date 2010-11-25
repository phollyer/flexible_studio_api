package api.events.ftp.getFileSize
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class GetFileSizeEvent extends FtpEvent
	{
		
	/**
	* The GetFileSizeEvent.RESULT constant defines the value of the
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
		
		public var size:Number = -1;
		
		public function GetFileSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFileSizeEvent = new GetFileSizeEvent( type );
			e.size = size;
			return e;
		}
	}
}