package api.events.sysInfo.getWindowList
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetWindowListEvent extends SysInfoEvent
	{
		
	/**
	* The GetWindowListEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>windowList</td><td>null</td></tr>
	* 
	* <tr><td>windowListXML</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var windowList:Array = null;
		public var windowListXML:XML = null;
		
		public function GetWindowListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetWindowListEvent = new GetWindowListEvent( type );
			e.windowList = windowList;
			e.windowListXML = windowListXML;
			return e;
		}
	}
}