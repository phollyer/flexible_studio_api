package api.events.iniFile.enumKeys
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class EnumKeysEvent extends IniFileEvent
	{
		/**
	* The EnumKeysEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>keys</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var keys:Array = null;
		
		public function EnumKeysEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnumKeysEvent = new EnumKeysEvent( type );
			e.keys = keys;
			return e;
		}	
	}
}