package api.events.flash.getStageSize
{
	import flash.events.Event;
	
	import api.events.flash.FlashEvent;

	public class GetStageSizeEvent extends FlashEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function GetStageSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetStageSizeEvent = new GetStageSizeEvent( type );
			e.height = height;
			e.width = width;
			return e;
		}
	}
}