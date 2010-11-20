package api.events.win.maximize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class MaximizeEvent extends WinEvent
	{
		
		public function MaximizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MaximizeEvent = new MaximizeEvent( type );
			return e;
		}
	}
}