package api.events.registry.enumValues
{
	import flash.events.Event;
	
	import api.events.registry.RegistryEvent;

	public class EnumValuesEvent extends RegistryEvent
	{
		/**
	* The EnumValuesEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>values</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var values:Array = null;
		
		public function EnumValuesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnumValuesEvent = new EnumValuesEvent( type );
			e.values = values;
			return e;
		}
	}
}