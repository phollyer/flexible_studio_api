package api.events.midi.notifiers
{
	import flash.events.Event;
	
	import api.events.midi.MidiEvent;

	public class ClearNotifyEvent extends MidiEvent
	{
		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearNotifyEvent = new ClearNotifyEvent( type );
			return e;
		}
	}
}