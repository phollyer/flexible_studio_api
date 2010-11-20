package api.events.iniFile.getVal
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class GetValEvent extends IniFileEvent
	{
		
	/**
	* The GetValEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>keyValue</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var keyValue:String = null;
		
		public function GetValEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetValEvent = new GetValEvent( type );
			e.keyValue = keyValue;
			return e;
		}
	}
}