package api.events.shell.execute
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class ExecuteEvent extends ShellEvent
	{
		/**
	* The ExecuteEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
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