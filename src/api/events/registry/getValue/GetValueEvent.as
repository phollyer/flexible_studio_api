package api.events.registry.getValue
{
	import flash.events.Event;
	
	import api.events.registry.RegistryEvent;

	public class GetValueEvent extends RegistryEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ROOT_KEY:String = "missingRootKey";
		public static const MISSING_SUB_KEY:String = "missingSubKey";
		public static const MISSING_VALUE_NAME:String = "missingValueName";
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