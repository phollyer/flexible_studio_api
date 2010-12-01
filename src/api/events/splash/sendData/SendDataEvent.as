package api.events.splash.sendData
{
	import flash.events.Event;
	
	import api.events.splash.SplashEvent;

	public class SendDataEvent extends SplashEvent
	{
		
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