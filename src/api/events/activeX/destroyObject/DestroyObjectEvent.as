package api.events.activeX.destroyObject
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class DestroyObjectEvent extends ActiveXEvent
	{		
		public function DestroyObjectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DestroyObjectEvent = new DestroyObjectEvent( type );
			return e;
		}
	}
}