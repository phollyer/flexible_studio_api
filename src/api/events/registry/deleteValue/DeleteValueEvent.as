package api.events.registry.deleteValue
{
	import flash.events.Event;
	
	import api.events.registry.RegistryEvent;

	public class DeleteValueEvent extends RegistryEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ROOT_KEY:String = "missingRootKey";
		public static const MISSING_SUB_KEY:String = "missingSubKey";
		public static const MISSING_VALUE_NAME:String = "missingValueName";
		
		public function DeleteValueEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DeleteValueEvent = new DeleteValueEvent( type );
			return e;
		}
	}
}