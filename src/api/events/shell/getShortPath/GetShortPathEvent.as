package api.events.shell.getShortPath
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class GetShortPathEvent extends ShellEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var shortPath:String = null;
		
		public function GetShortPathEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetShortPathEvent = new GetShortPathEvent( type );
			e.shortPath = shortPath;
			return e;
		}
	}
}