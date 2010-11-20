package api.events.wmAudio.setIndex
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class SetIndexEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_INDEX:String = "missingIndex";
		
		public function SetIndexEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetIndexEvent = new SetIndexEvent( type );
			return e;
		}
	}
}