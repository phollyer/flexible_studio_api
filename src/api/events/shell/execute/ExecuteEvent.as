package api.events.shell.execute
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class ExecuteEvent extends ShellEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var elapsed:Number = 0;
		public var exitCode:String = null;
		public var hwnd:String = null;
		public var output:String = null;
		public var pid:String = null
		
		public function ExecuteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ExecuteEvent = new ExecuteEvent(type);
			e.elapsed = elapsed;
			e.exitCode = exitCode;
			e.hwnd = hwnd;
			e.output = output;
			e.pid = pid;
			return e;
		}
	}
}