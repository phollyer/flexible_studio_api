package api.events.midi.getInfo
{
	import flash.events.Event;
	
	import api.events.midi.MidiEvent;

	public class GetInfoEvent extends MidiEvent
	{
		public static const COMPLETE:String = "complete";
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