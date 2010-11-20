package api.events.registry.setValue
{
	import flash.events.Event;
	
	import api.events.registry.RegistryEvent;

	public class SetValueEvent extends RegistryEvent
	{
		
		public function SetValueEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetValueEvent = new SetValueEvent( type );
			return e;
		}
	}
}