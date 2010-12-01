package api.events.win.showBorder
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class ShowBorderEvent extends WinEvent
	{
		
		public function ShowBorderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowBorderEvent = new ShowBorderEvent( type );
			return e;
		}
	}
}