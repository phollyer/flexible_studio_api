package api.events.wmAudio.getVersion
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class GetVersionEvent extends WmAudioEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var version:Number = -1;
		
		public function GetVersionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetVersionEvent = new GetVersionEvent( type );
			e.version = version;
			return e;
		}
	}
}