package api.events.printer.getProperties
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;
	import api.vos.printer.PropertiesVO;

	public class GetPropertiesEvent extends PrinterEvent
	{
		/**
	* The GetPropertiesEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>properties</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var properties:PropertiesVO = null;
		
		public function GetPropertiesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetPropertiesEvent = new GetPropertiesEvent( type );
			e.properties = properties;
			return e;
		}
	}
}