package api.events.ftp.getXMLDirList
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class GetXMLDirListEvent extends FtpEvent
	{
		/**
	* The GetXMLDirListEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>xml</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var xml:XML = null;
		
		public function GetXMLDirListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetXMLDirListEvent = new GetXMLDirListEvent( type );
			e.xml = xml;
			return e;
		}
	}
}