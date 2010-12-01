package api.events.win.setFocus
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetFocusEvent extends WinEvent
	{
		
		public function SetFocusEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetFocusEvent = new SetFocusEvent( type );
			return e;
		}
	}
}