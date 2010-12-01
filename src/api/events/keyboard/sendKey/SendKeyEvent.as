package api.events.keyboard.sendKey
{
	import flash.events.Event;
	
	import api.events.keyboard.KeyboardEvent;

	public class SendKeyEvent extends KeyboardEvent
	{
		
		public function SendKeyEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendKeyEvent = new SendKeyEvent( type );
			return e;
		}
	}
}