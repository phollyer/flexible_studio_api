package api.events.shell.resolveMoniker
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class ResolveMonikerEvent extends ShellEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var fullPath:String = null;
		
		public function ResolveMonikerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ResolveMonikerEvent = new ResolveMonikerEvent( type );
			e.fullPath = fullPath;
			return e;
		}
	}
}