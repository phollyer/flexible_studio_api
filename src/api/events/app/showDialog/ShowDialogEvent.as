package api.events.app.showDialog
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowDialogEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_HWND:String = "missingHWND";
		
		public function ShowDialogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowDialogEvent = new ShowDialogEvent( type );
			return e;
		}
	}
}