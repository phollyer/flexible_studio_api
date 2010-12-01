package api.events.registry
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class RegistryEvent extends SWFStudioEvent
	{
		public function RegistryEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RegistryEvent = new RegistryEvent( type );
			return e;
		}
	}
}