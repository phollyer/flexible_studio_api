package api.events.registry.deleteValue
{
	import flash.events.Event;
	
	import api.events.registry.RegistryEvent;

	public class DeleteValueEvent extends RegistryEvent
	{
		
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