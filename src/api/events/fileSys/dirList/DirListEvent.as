package api.events.fileSys.dirList
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class DirListEvent extends FileSysEvent
	{
		/**
	* The DirListEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>directoryList</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var directoryList:Array = null;
		
		public function DirListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DirListEvent = new DirListEvent( type );
			e.directoryList = directoryList;
			return e;
		}
	}
}