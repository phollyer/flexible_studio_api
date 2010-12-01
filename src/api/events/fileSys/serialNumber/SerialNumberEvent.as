package api.events.fileSys.serialNumber
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class SerialNumberEvent extends FileSysEvent
	{
		
	/**
	* The SerialNumberEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>number</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var number:String = null;
		
		public function SerialNumberEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SerialNumberEvent = new SerialNumberEvent( type );
			e.number = number;
			return e;
		}
	}
}