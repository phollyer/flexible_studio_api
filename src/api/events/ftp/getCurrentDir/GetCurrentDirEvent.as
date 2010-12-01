package api.events.ftp.getCurrentDir
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class GetCurrentDirEvent extends FtpEvent
	{
		
	/**
	* The GetCurrentDirEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>currentDir</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var currentDir:String = null;
		
		public function GetCurrentDirEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetCurrentDirEvent = new GetCurrentDirEvent( type );
			e.currentDir = currentDir;
			return e;
		}
	}
}