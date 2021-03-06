package api.events.app.showInputBox
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowInputBoxEvent extends AppEvent
	{
		/**
    * The ShowInputBoxEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>text</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT:String = "result";		
		public var text:String = null;
		
		public function ShowInputBoxEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowInputBoxEvent = new ShowInputBoxEvent( type );
			e.text = text;
			return e;
		}
	}
}