package api.events.wmAudio.setVersion
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class SetVersionEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_VERSION:String = "invalidVersion";
		public static const MISSING_VERSION:String = "missingVersion";
		
		public function SetVersionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetVersionEvent = new SetVersionEvent( type );
			return e;
		}
	}
}