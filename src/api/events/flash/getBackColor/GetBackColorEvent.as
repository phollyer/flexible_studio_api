package api.events.flash.getBackColor
{
	import flash.events.Event;
	
	import api.events.flash.FlashEvent;

	public class GetBackColorEvent extends FlashEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var color:String = null;
		
		public function GetBackColorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetBackColorEvent = new GetBackColorEvent( type );
			e.color = color;
			return e;
		}
	}
}