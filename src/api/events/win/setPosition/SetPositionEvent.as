package api.events.win.setPosition
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetPositionEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetPositionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}		
		override public function clone():Event
		{
			var e : SetPositionEvent = new SetPositionEvent(type);
			return e;
		}
	}
}