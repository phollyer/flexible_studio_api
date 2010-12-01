package api.events.midi.notifiers
{
	import api.events.midi.MidiEvent;
	
	import flash.events.Event;

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
		
		public var cmd:String = null;
		public var id:String = null;
		public var msec:Number = -1;
		public var RAW_DATA:Object = null;
		public var value1:Object = null;
		public var value2:Object = null;	
		
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