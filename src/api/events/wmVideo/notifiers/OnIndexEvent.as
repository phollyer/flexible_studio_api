package api.events.wmVideo.notifiers
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class OnIndexEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var data:String = null;
		
		public function OnIndexEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnIndexEvent = new OnIndexEvent( type );
			e.data = data;
			return e;
		}
	}
}