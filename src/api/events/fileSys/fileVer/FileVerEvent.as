package api.events.fileSys.fileVer
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class FileVerEvent extends FileSysEvent
	{
		/**
	* The FileVerEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>version</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var version:String = null;
		
		public function FileVerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FileVerEvent = new FileVerEvent( type );
			e.version = version;
			return e;
		}
	}
}