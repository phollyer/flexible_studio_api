package api.events.keyboard.sendPress
{
	import flash.events.Event;
	import api.events.keyboard.KeyboardEvent

	public class SendPressEvent extends KeyboardEvent
	{
		
		public function SendPressEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendPressEvent = new SendPressEvent( type );
			return e;
		}
	}
}