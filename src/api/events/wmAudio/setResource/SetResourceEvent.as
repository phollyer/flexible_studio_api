package api.events.wmAudio.setResource
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class SetResourceEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_RESOURCE:String = "missingResource";
		
		public function SetResourceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetResourceEvent = new SetResourceEvent( type );
			return e;
		}
	}
}