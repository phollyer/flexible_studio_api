package api.events.win.showButtons
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class ShowButtonsEvent extends WinEvent
	{
		
		public function ShowButtonsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowButtonsEvent = new ShowButtonsEvent( type );
			return e;
		}
	}
}