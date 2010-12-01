package api.events.shell.getLongPath
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class GetLongPathEvent extends ShellEvent
	{
		
	/**
	* The GetLongPathEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>longPath</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
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