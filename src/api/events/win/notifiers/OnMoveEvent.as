package api.events.win.notifiers
{
	import flash.events.Event;

	public class OnMoveEvent extends Event
	{
		public static const STATUS:String = "status";
		public static const COMPLETE:String = "complete";
		
		public var x:Number = -1;
		public var y:Number = -1;
		
		public function OnMoveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnMoveEvent = new OnMoveEvent( type );
			e.x = x;
			e.y = y;
			return e;
		}
	}
}