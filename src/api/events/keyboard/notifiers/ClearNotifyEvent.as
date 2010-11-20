package api.events.keyboard.notifiers
{
	import flash.events.Event;
	import api.events.keyboard.KeyboardEvent

	public class ClearNotifyEvent extends KeyboardEvent
	{
		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
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