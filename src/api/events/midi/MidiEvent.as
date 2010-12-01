package api.events.midi
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class MidiEvent extends SWFStudioEvent
	{
		public function MidiEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MidiEvent = new MidiEvent( type );
			return e;
		}
	}
}