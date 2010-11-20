package api.events.midi
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class MidiEvent extends KernelEvent
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