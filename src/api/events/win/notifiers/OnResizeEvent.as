package api.events.win.notifiers
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class OnResizeEvent extends WinEvent
	{
		public static const STATUS:String = "status";
		public static const COMPLETE:String = "complete";
		
		public var clientHeight:Number = -1;
		public var clientWidth:Number = -1;
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function OnResizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnResizeEvent = new OnResizeEvent( type );
			e.clientHeight = clientHeight;
			e.clientWidth = clientWidth;
			e.height = height;
			e.width = width;
			return e;
		}
	}
}