package api.events.app.confirmDialog
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ConfirmDialogEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_HWND:String = "missingHWND";
		
		public function ConfirmDialogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ConfirmDialogEvent = new ConfirmDialogEvent( type );
			return e;
		}
	}
}