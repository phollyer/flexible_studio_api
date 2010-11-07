package api.events.app.cancelDialog
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class CancelDialogEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_HWND:String = "missingHWND";
		
		public function CancelDialogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CancelDialogEvent = new CancelDialogEvent( type );
			return e;
		}
	}
}