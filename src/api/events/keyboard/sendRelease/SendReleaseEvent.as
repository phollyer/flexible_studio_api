package api.events.keyboard.sendRelease
{
	import flash.events.Event;
	import api.events.keyboard.KeyboardEvent

	public class SendReleaseEvent extends KeyboardEvent
	{
		
		public function SendReleaseEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendReleaseEvent = new SendReleaseEvent( type );
			return e;
		}
	}
}