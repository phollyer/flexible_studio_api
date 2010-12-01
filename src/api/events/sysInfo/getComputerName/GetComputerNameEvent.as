package api.events.sysInfo.getComputerName
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetComputerNameEvent extends SysInfoEvent
	{
		/**
	* The GetComputerNameEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>computerName</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var computerName:String = null;
		
		public function GetComputerNameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetComputerNameEvent = new GetComputerNameEvent( type );
			e.computerName;
			return e;
		}
	}
}