package api.events.win.sendMessage
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SendMessageEvent extends WinEvent
	{
		
		public function SendMessageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendMessageEvent = new SendMessageEvent( type );
			return e;
		}
	}
}