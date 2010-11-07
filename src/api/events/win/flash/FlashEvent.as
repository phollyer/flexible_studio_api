package api.events.win.flash
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class FlashEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function FlashEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FlashEvent = new FlashEvent( type );
			return e;
		}
	}
}