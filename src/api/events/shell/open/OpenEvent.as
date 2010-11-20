package api.events.shell.open
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class OpenEvent extends ShellEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var applicationPath:String = null;
		
		public function OpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OpenEvent = new OpenEvent( type );
			e.applicationPath = applicationPath;
			return e;
		}
	}
}