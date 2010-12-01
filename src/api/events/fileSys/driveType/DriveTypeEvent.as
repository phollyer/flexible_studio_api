package api.events.fileSys.driveType
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class DriveTypeEvent extends FileSysEvent
	{
		
	/**
	* The DriveTypeEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>typeOfDrive</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var typeOfDrive:String = null;
		
		public function DriveTypeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DriveTypeEvent = new DriveTypeEvent( type );
			e.typeOfDrive = typeOfDrive;
			return e;
		}
	}
}