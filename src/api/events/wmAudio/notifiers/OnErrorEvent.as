package api.events.wmAudio.notifiers
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class OnErrorEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var data:String = null;
		
		public function OnErrorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnErrorEvent = new OnErrorEvent( type );
			e.data = data;
			return e;
		}
	}
}