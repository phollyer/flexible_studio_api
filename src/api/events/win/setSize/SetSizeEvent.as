package api.events.win.setSize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetSizeEvent extends WinEvent
	{
		
		public function SetSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetSizeEvent = new SetSizeEvent( type );
			return e;
		}
	}
}