package api.events.layout.getFileList
{
	import flash.events.Event;
	
	import api.events.layout.LayoutEvent;

	public class GetFileListEvent extends LayoutEvent
	{
		
	/**
	* The GetFileListEvent.INVALID_FORMAT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>invalidFormat</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType invalidFormat
	*/
		public static const INVALID_FORMAT:String = "invalidFormat";
		
	/**
	* The GetFileListEvent.RESULT constant defines the value of the
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

		public var fileList:Array = null;
		public var text:String = null;
		public var xml:XML = null;
		
		public function GetFileListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFileListEvent = new GetFileListEvent( type );
			e.fileList = fileList;
			e.text = text;
			e.xml = xml;
			return e;
		}
	}
}