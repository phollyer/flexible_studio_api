package api.events.fileSys.readFileUTF16
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class ReadFileUTF16Event extends FileSysEvent
	{
		/**
	* The ReadFileUTF16Event.RESULT constant defines the value of the
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
		
		public function ReadFileUTF16Event(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ReadFileUTF16Event = new ReadFileUTF16Event( type );
			e.data = data;
			return e;
		}
	}
}