package api.events.app.sendData
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class SendDataEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SendDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendDataEvent = new SendDataEvent( type );
			return e;
		}
	}
}