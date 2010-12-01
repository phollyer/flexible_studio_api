package api.events.wmAudio
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class WmAudioEvent extends SWFStudioEvent
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