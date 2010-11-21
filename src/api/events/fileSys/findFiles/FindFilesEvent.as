package api.events.fileSys.findFiles
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class FindFilesEvent extends FileSysEvent
	{
		/**
	* The FindFilesEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>fileList</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";		
		
		public var fileList:Array = null;
		
		public function FindFilesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e : FindFilesEvent = new FindFilesEvent(type);
			e.fileList = fileList;
			return e;
		}		
	}
}