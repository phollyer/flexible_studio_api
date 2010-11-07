package api.events.wmAudio.setVolume
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class SetVolumeEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetVolumeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetVolumeEvent = new SetVolumeEvent( type );
			return e;
		}
	}
}