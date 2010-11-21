package api.events.fileSys.getFolderSize
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class GetFolderSizeEvent extends FileSysEvent
	{
		/**
	* The GetFolderSizeEvent.RESULT constant defines the value of the
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
		
		public var bytes:Number = -1;
		public var gigabytes:Number = -1;
		public var kilobytes:Number = -1;
		public var megabytes:Number = -1;
		
		public function GetFolderSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFolderSizeEvent = new GetFolderSizeEvent( type );
			e.bytes = bytes;
			e.gigabytes = gigabytes;
			e.kilobytes = kilobytes;
			e.megabytes = megabytes;
			return e;
		}
	}
}