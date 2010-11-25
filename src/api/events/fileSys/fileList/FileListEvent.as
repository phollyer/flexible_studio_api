package api.events.fileSys.fileList
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class FileListEvent extends FileSysEvent
	{
		
	/**
	* The FileListEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>files</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var files:Array = null;
		
		public function FileListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FileListEvent = new FileListEvent( type );
			e.files = files;
			return e;
		}
	}
}