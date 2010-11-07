package api.events.shell.getLongPath
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class GetLongPathEvent extends ShellEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var longPath:String = null;
		
		public function GetLongPathEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetLongPathEvent = new GetLongPathEvent( type );
			e.longPath = longPath;
			return e;
		}
	}
}