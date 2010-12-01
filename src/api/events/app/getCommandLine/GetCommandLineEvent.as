package api.events.app.getCommandLine
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class GetCommandLineEvent extends AppEvent
	{
		/**
    * The GetCommandLineEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>commandLine</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT:String = "result";		
		public var commandLine:String = null;
		
		public function GetCommandLineEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetCommandLineEvent = new GetCommandLineEvent( type );
			e.commandLine = commandLine;
			return e;
		}
	}
}