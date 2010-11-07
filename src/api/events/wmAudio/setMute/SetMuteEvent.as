package api.events.wmAudio.setMute
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class SetMuteEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetMuteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetMuteEvent = new SetMuteEvent( type );
			return e;
		}
	}
}