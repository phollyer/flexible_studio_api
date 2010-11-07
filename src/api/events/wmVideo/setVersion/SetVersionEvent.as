package api.events.wmVideo.setVersion
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetVersionEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_VERSION:String = "invalidVersion";
		public static const MISSING_VERSION:String = "missingVersion";
		
		public function SetVersionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetVersionEvent = new SetVersionEvent( type );
			return e;
		}
	}
}