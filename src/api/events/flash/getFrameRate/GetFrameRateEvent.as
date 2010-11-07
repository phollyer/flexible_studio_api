package api.events.flash.getFrameRate
{
	import flash.events.Event;
	
	import api.events.flash.FlashEvent;

	public class GetFrameRateEvent extends FlashEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var frameRate:Number = -1;
		
		public function GetFrameRateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFrameRateEvent = new GetFrameRateEvent( type );
			e.frameRate = frameRate;
			return e;
		}
	}
}