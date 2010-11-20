package api.events.app.showMessageBox
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowMessageBoxEvent extends AppEvent
	{
		
    /**
    * The ShowMessageBoxEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>selectedButton</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT : String = "result";
		public static const RESULT:String = "result";
		
    /**
    * The ShowMessageBoxEvent.COMPLETE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>complete</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>selectedButton</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType complete
    */
		public static const COMPLETE:String = "complete";
		
    /**
    * The ShowMessageBoxEvent.MISSING_PROMPT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingPrompt</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>selectedButton</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType missingPrompt
    */
		public static const MISSING_PROMPT:String = "missingPrompt";
		
		public var selectedButton:String = null;
		
		public function ShowMessageBoxEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowMessageBoxEvent = new ShowMessageBoxEvent( type );
			e.selectedButton = selectedButton;
			return e;
		}
	}
}