package api.events.fileSys.fileSize
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class FileSizeEvent extends FileSysEvent
	{
		
	/**
	* The FileSizeEvent.RESULT constant defines the value of the
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
		
		public function FileSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FileSizeEvent = new FileSizeEvent( type );
			e.size = size;
			return e;
		}
	}
}