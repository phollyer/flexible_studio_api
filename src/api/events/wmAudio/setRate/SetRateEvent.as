package api.events.wmAudio.setRate
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class SetRateEvent extends WmAudioEvent
	{
		
		public function SetRateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetRateEvent = new SetRateEvent( type );
			return e;
		}
	}
}