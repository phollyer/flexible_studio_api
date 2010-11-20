package api.events.printer.getProperties
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;
	import api.vos.printer.PropertiesVO;

	public class GetPropertiesEvent extends PrinterEvent
	{	
		public static const COMPLETE:String = "complete";
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