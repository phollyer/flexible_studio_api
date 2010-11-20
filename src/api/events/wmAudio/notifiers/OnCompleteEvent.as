package api.events.wmAudio.notifiers
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class OnCompleteEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public function OnCompleteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnCompleteEvent = new OnCompleteEvent( type );
			return e;
		}
	}
}