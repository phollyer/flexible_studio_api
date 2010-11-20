package api.events.wmAudio.play
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class PlayEvent extends WmAudioEvent
	{
		
		public function PlayEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PlayEvent = new PlayEvent( type );
			return e;
		}
	}
}