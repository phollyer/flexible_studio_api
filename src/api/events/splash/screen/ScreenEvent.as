package api.events.splash.screen
{
	import flash.events.Event;
	
	import api.events.splash.SplashEvent;

	public class ScreenEvent extends SplashEvent
	{
		public static const STATUS:String = "status";
		
		public var data:String = null;
		
		public function ScreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ScreenEvent = new ScreenEvent( type );
			e.data = data;
			return e;
		}
	}
}