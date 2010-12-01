package api.events.sysInfo.getDriveLabel
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetDriveLabelEvent extends SysInfoEvent
	{
		/**
	* The GetDriveLabelEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>driveLabel</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var driveLabel:String = null;
		
		public function GetDriveLabelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDriveLabelEvent = new GetDriveLabelEvent( type );
			e.driveLabel = driveLabel;
			return e;
		}
	}
}