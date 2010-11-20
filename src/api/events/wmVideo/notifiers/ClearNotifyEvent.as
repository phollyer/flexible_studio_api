package api.events.wmVideo.notifiers
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class ClearNotifyEvent extends WmVideoEvent
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