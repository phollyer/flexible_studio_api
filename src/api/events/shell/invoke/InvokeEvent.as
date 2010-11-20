package api.events.shell.invoke
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class InvokeEvent extends ShellEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var elapsed:Number = -1;
		public var exitCode:String = null;
		public var hwnd:String = null;
		
		public function InvokeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : InvokeEvent = new InvokeEvent( type );
			e.elapsed = elapsed;
			e.exitCode = exitCode;
			e.hwnd = hwnd;
			return e;
		}
	}
}