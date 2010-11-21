package api.events.midi.notifiers
{
	import flash.events.Event;
	
	import api.events.midi.MidiEvent;

	public class OnRawDataEvent extends MidiEvent
	{
		/**
	* The OnRawDataEvent.CHANGE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>change</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType change
	*/
		public static const CHANGE:String = "change";
		/**
	* The OnRawDataEvent.RESULT constant defines the value of the
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
		
		public function OnRawDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnRawDataEvent = new OnRawDataEvent( type );
			e.cmd = cmd;
			e.id = id;
			e.msec = msec;
			e.RAW_DATA = RAW_DATA;
			e.value1 = value1;
			e.value2 = value2;
			return e;
		}
	}
}