package api.events.keyboard.sendString
{
	import flash.events.Event;
	import api.events.keyboard.KeyboardEvent

	public class SendStringEvent extends KeyboardEvent
	{
		
		public function SendStringEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendStringEvent = new SendStringEvent( type );
			return e;
		}
	}
}