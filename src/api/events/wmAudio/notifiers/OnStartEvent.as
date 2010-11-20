package api.events.wmAudio.notifiers
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class OnStartEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var duration:String = null;
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function OnStartEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnStartEvent = new OnStartEvent( type );
			e.duration = duration;
			e.height = height;
			e.width = width;
			return e;
		}
	}
}