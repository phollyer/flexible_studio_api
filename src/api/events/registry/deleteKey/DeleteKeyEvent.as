package api.events.registry.deleteKey
{
	import flash.events.Event;
	
	import api.events.registry.RegistryEvent;

	public class DeleteKeyEvent extends RegistryEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ROOT_KEY:String = "missingRootKey";
		public static const MISSING_SUB_KEY:String = "missingSubKey";
		
		public function DeleteKeyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DeleteKeyEvent = new DeleteKeyEvent( type );
			return e;
		}
	}
}