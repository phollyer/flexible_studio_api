package api.events.app.getCommandLine
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class GetCommandLineEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
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