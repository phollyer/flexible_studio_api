package api.events.wmAudio.setPlayCount
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class SetPlayCountEvent extends WmAudioEvent
	{
		
		public function SetPlayCountEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPlayCountEvent = new SetPlayCountEvent( type );
			return e;
		}
	}
}