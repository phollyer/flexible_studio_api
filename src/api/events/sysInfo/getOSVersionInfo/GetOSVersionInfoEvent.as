package api.events.sysInfo.getOSVersionInfo
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetOSVersionInfoEvent extends SysInfoEvent
	{
		/**
	* The GetOSVersionInfoEvent.RESULT constant defines the value of the
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

		public var is64Bit:Boolean = false;
		public var longInfo:String = null;
		public var platform:String = null;
		public var shortInfo:String = null;
		public var version:String = null;
		
		public function GetOSVersionInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetOSVersionInfoEvent = new GetOSVersionInfoEvent( type );
			e.is64Bit = is64Bit;
			e.longInfo = longInfo;
			e.platform = platform;
			e.shortInfo = shortInfo;
			e.version = version;
			return e;
		}
	}
}