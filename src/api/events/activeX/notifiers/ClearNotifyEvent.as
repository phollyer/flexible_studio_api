package api.events.activeX.notifiers
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class ClearNotifyEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_EVENT:String = "missingEvent";
		public static const MISSING_OBJECT:String = "missingObject";
		
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