package api.events.win.hide
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class HideEvent extends WinEvent
	{
		
		public function HideEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : HideEvent = new HideEvent( type );
			return e;
		}
	}
}