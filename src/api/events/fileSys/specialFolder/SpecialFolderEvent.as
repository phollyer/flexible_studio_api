package api.events.fileSys.specialFolder
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class SpecialFolderEvent extends FileSysEvent
	{
		
	/**
	* The SpecialFolderEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>folderPath</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var folderPath:String = null;
		
		public function SpecialFolderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SpecialFolderEvent = new SpecialFolderEvent( type );
			e.folderPath = folderPath;
			return e;
		}
	}
}