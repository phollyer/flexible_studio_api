package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnDialogEvent extends AppEvent
	{
		/**
    * The OnDialogEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>captionDialog</td><td>null</td></tr>
    * 
    * <tr><td>captionParent</td><td>null</td></tr>
    * 
    * <tr><td>hwndDialog</td><td>null</td></tr>
    * 
    * <tr><td>isChild</td><td>true</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
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