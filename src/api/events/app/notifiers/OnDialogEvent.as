package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnDialogEvent extends AppEvent
	{
		public static const RESULT:String = "result";
		
		public var captionDialog:String = null;
		public var captionParent:String = null;
		public var hwndDialog:String = null;
		public var isChild:Boolean = true;
		
		public function OnDialogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnDialogEvent = new OnDialogEvent( type );
			e.captionDialog = captionDialog;
			e.captionParent = captionParent;
			e.hwndDialog = hwndDialog;
			e.isChild = isChild;
			return e;
		}
	}
}