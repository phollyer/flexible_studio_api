package api.events.splash
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class SplashEvent extends KernelEvent
	{
		public function SplashEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SplashEvent = new SplashEvent( type );
			return e;
		}
	}
}