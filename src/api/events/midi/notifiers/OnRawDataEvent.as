package api.events.midi.notifiers
{
	import flash.events.Event;
	
	import api.events.midi.MidiEvent;

	public class OnRawDataEvent extends MidiEvent
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		
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