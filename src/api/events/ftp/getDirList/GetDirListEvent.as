package api.events.ftp.getDirList
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class GetDirListEvent extends FtpEvent
	{
		
	/**
	* The GetDirListEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>dirList</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var dirList:Array = null;
		
		public function GetDirListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDirListEvent = new GetDirListEvent( type );
			e.dirList = dirList;
			return e;
		}
	}
}