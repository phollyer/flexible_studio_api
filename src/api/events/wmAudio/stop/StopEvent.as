package api.events.wmAudio.stop
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class StopEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		
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