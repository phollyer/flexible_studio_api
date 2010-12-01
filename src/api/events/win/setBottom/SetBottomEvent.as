package api.events.win.setBottom
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetBottomEvent extends WinEvent
	{
		
		public function SetBottomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetBottomEvent = new SetBottomEvent( type );
			return e;
		}
	}
}