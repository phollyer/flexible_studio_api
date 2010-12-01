package api.events.midi.start
{
	import flash.events.Event;
	
	import api.events.midi.MidiEvent;

	public class StartEvent extends MidiEvent
	{
		
		public function StartEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : StartEvent = new StartEvent( type );
			return e;
		}
	}
}