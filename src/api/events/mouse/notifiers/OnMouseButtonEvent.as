package api.events.mouse.notifiers
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class OnMouseButtonEvent extends MouseEvent
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		
		public var button:String = null;
		public var state:String = null;
		public var x:Number = -1;
		public var y:Number = -1;
		
		public function OnMouseButtonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnMouseButtonEvent = new OnMouseButtonEvent( type );
			e.button = button;
			e.state = state;
			e.x = x;
			e.y = y;
			return e;
		}
	}
}