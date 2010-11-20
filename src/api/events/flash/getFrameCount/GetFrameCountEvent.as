package api.events.flash.getFrameCount
{
	import flash.events.Event;
	
	import api.events.flash.FlashEvent;

	public class GetFrameCountEvent extends FlashEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var totalFrames:Number = -1;
		
		public function GetFrameCountEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFrameCountEvent = new GetFrameCountEvent( type );
			e.totalFrames = totalFrames;
			return e;
		}
	}
}