package api.events.wmVideo.notifiers
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class OnErrorEvent extends WmVideoEvent
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