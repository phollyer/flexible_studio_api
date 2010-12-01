package api.events.midi.stop
{
	import flash.events.Event;
	
	import api.events.midi.MidiEvent;

	public class StopEvent extends MidiEvent
	{
		
		public function StopEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : StopEvent = new StopEvent( type );
			return e;
		}
	}
}