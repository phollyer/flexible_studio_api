package api.events.sysInfo.getEnv
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetEnvEvent extends SysInfoEvent
	{
		/**
	* The GetEnvEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>value</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var value:String = null;
		
		public function GetEnvEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetEnvEvent = new GetEnvEvent( type );
			e.value = value;
			return e;
		}
	}
}