package api.events.wmVideo.setIndex
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetIndexEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_INDEX:String = "missingIndex";
		
		public function SetIndexEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetIndexEvent = new SetIndexEvent( type );
			return e;
		}
	}
}