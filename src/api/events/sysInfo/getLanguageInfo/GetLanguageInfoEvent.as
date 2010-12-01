package api.events.sysInfo.getLanguageInfo
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetLanguageInfoEvent extends SysInfoEvent
	{
		/**
	* The GetLanguageInfoEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>primaryLanguage</td><td>null</td></tr>
	* 
	* <tr><td>subLanguage</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var primaryLanguage:String = null;
		public var subLanguage:String = null;
		
		public function GetLanguageInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetLanguageInfoEvent = new GetLanguageInfoEvent( type );
			e.primaryLanguage = primaryLanguage;
			e.subLanguage = subLanguage;
			return e;
		}
	}
}