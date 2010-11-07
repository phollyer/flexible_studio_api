package api.events.registry.enumKeys
{
	import flash.events.Event;
	
	import api.events.registry.RegistryEvent;

	public class EnumKeysEvent extends RegistryEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ROOT_KEY:String = "missingRootKey";
		public static const MISSING_SUB_KEY:String = "missingSubKey";
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