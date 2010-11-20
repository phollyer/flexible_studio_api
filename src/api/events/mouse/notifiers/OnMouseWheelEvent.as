package api.events.mouse.notifiers
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class OnMouseWheelEvent extends MouseEvent
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		
		public var keymask:String = null;
		public var scroll:Number = 0;
		public var x:Number = -1;
		public var y:Number = -1;
		
		public function OnMouseWheelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnMouseWheelEvent = new OnMouseWheelEvent( type );
			e.keymask = keymask;
			e.scroll = scroll;
			e.x = x;
			e.y = y;
			return e;
		}
	}
}