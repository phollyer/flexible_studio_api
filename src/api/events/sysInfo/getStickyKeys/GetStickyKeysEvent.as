package api.events.sysInfo.getStickyKeys
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetStickyKeysEvent extends SysInfoEvent
	{
		/**
	* The GetStickyKeysEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>hotkey</td><td>false</td></tr>
	* 
	* <tr><td>sticky</td><td>false</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var hotkey:Boolean = false;
		public var sticky:Boolean = false;
		
		public function GetStickyKeysEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetStickyKeysEvent = new GetStickyKeysEvent( type );
			e.hotkey = hotkey;
			e.sticky = sticky;
			return e;
		}
	}
}