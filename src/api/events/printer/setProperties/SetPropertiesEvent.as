package api.events.printer.setProperties
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class SetPropertiesEvent extends PrinterEvent
	{	
		public static const COMPLETE:String = "complete";
		
		public function SetPropertiesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPropertiesEvent = new SetPropertiesEvent( type );
			return e;
		}
	}
}