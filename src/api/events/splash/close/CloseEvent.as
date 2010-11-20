package api.events.splash.close
{
	import flash.events.Event;
	
	import api.events.splash.SplashEvent;

	public class CloseEvent extends SplashEvent
	{
		
		public function CloseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CloseEvent = new CloseEvent( type );
			return e;
		}
	}
}