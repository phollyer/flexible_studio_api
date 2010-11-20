package api.events.wmAudio
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class WmAudioEvent extends KernelEvent
	{
		public function WmAudioEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WmAudioEvent = new WmAudioEvent( type );
			return e;
		}
	}
}