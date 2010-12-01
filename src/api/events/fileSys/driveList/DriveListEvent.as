package api.events.fileSys.driveList
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class DriveListEvent extends FileSysEvent
	{
		
	/**
	* The DriveListEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>drives</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var drives:Array = null;
		
		public function DriveListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DriveListEvent = new DriveListEvent( type );
			e.drives = drives;
			return e;
		}
	}
}