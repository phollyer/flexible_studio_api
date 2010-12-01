package api.events.activeX.notifiers
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class ClearNotifyEvent extends ActiveXEvent
	{		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearNotifyEvent = new ClearNotifyEvent( type );
			return e;
		}
	}
}