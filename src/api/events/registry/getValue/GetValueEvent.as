package api.events.registry.getValue
{
	import flash.events.Event;
	
	import api.events.registry.RegistryEvent;

	public class GetValueEvent extends RegistryEvent
	{
		/**
	* The GetValueEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>dataType</td><td>null</td></tr>
	* 
	* <tr><td>value</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var dataType:Object = null;
		public var value:String = null;
		
		public function GetValueEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetValueEvent = new GetValueEvent( type );
			e.dataType = dataType;
			e.value = value;
			return e;
		}
	}
}