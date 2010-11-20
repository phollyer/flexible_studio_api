package api.events.registry.enumKeys
{
	import flash.events.Event;
	
	import api.events.registry.RegistryEvent;

	public class EnumKeysEvent extends RegistryEvent
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
	* <tr><td>subKeys</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var subKeys:Array = null;
		
		public function EnumKeysEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnumKeysEvent = new EnumKeysEvent( type );
			e.subKeys = subKeys;
			return e;
		}
	}
}