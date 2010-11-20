package api.events.fileSys.readFileBinary
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class ReadFileBinaryEvent extends FileSysEvent
	{
		
	/**
	* The ReadFileBinaryEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>data</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var data:String = null;
		
		public function ReadFileBinaryEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ReadFileBinaryEvent = new ReadFileBinaryEvent( type );
			e.data = data;
			return e;
		}
	}
}