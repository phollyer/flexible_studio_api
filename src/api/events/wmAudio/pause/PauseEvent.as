package api.events.wmAudio.pause
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class PauseEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function PauseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PauseEvent = new PauseEvent( type );
			return e;
		}
	}
}