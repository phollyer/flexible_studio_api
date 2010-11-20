package api.events.mouse.hide
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class HideEvent extends MouseEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var displayCounter:Number = -1;
		
		public function HideEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : HideEvent = new HideEvent( type );
			e.displayCounter = displayCounter;
			return e;
		}
	}
}