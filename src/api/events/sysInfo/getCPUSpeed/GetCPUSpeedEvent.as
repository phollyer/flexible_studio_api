package api.events.sysInfo.getCPUSpeed
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetCPUSpeedEvent extends SysInfoEvent
	{
		/**
	* The GetCPUSpeedEvent.RESULT constant defines the value of the
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
		
		public var speed:Number = -1;
		
		public function GetCPUSpeedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetCPUSpeedEvent = new GetCPUSpeedEvent( type );
			e.speed = speed;
			return e;
		}
	}
}