package api.events.win.minimize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class MinimizeEvent extends WinEvent
	{
		
		public function MinimizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MinimizeEvent = new MinimizeEvent( type );
			return e;
		}
	}
}