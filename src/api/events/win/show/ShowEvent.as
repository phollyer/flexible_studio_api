package api.events.win.show
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class ShowEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function ShowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowEvent = new ShowEvent( type );
			return e;
		}
	}
}