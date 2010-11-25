package api.events.shell.invoke
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class InvokeEvent extends ShellEvent
	{
		
	/**
	* The InvokeEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>exitCode</td><td>null</td></tr>
	* 
	* <tr><td>hwnd</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
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