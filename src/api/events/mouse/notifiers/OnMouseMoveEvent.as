package api.events.mouse.notifiers
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class OnMouseMoveEvent extends MouseEvent
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		
		public var sx:Number = -1;
		public var sy:Number = -1;
		public var x:Number = -1;
		public var y:Number = -1;
		
		public function OnMouseMoveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnMouseMoveEvent = new OnMouseMoveEvent( type );
			e.sx = sx;
			e.sy = sy;
			e.x = x;
			e.y = y;
			return e;
		}
	}
}