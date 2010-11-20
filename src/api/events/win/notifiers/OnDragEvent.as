package api.events.win.notifiers
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class OnDragEvent extends WinEvent
	{
		public static const STATUS:String = "status";
		public static const COMPLETE:String = "complete";
		
		public var data:String = null;
		
		public function OnDragEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnDragEvent = new OnDragEvent( type );
			e.data = data;
			return e;
		}
	}
}