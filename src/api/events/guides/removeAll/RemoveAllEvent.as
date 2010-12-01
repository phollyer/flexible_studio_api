package api.events.guides.removeAll
{
	import flash.events.Event;
	
	import api.events.guides.GuidesEvent;

	public class RemoveAllEvent extends GuidesEvent
	{
		
		public function RemoveAllEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RemoveAllEvent = new RemoveAllEvent( type );
			return e;
		}
	}
}