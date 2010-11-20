package api.events.win.setClientSize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetClientSizeEvent extends WinEvent
	{
		
		public function SetClientSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetClientSizeEvent = new SetClientSizeEvent( type );
			return e;
		}
	}
}