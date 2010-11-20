package api.events.win
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class WinEvent extends KernelEvent
	{				
		public static const STATE_CHANGED:String = null;
		
		public var state:String = null;
		
		public function WinEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WinEvent = new WinEvent(type);
			e.state = state;
			return e;
		}
	}
}