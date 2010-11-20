package api.events.midi.getInfo
{
	import flash.events.Event;
	
	import api.events.midi.MidiEvent;

	public class GetInfoEvent extends MidiEvent
	{
		/**
	* The GetInfoEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>deviceData</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var deviceData:XML = null;
		
		public function GetInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetInfoEvent = new GetInfoEvent( type );
			e.deviceData = deviceData;
			return e;
		}
	}
}