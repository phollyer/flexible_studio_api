package api.events.registry.enumValues
{
	import flash.events.Event;
	
	import api.events.registry.RegistryEvent;

	public class EnumValuesEvent extends RegistryEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ROOT_KEY:String = "missingRootKey";
		public static const MISSING_SUB_KEY:String = "missingSubKey";
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