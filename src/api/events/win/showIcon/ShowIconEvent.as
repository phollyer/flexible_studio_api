package api.events.win.showIcon
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class ShowIconEvent extends WinEvent
	{
		
		public function ShowIconEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowIconEvent = new ShowIconEvent( type );
			return e;
		}
	}
}