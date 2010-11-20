package api.events.win.restore
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class RestoreEvent extends WinEvent
	{
		
		public function RestoreEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RestoreEvent = new RestoreEvent( type );
			return e;
		}
	}
}