package api.events.splash.loadImage
{
	import flash.events.Event;
	
	import api.events.splash.SplashEvent;

	public class LoadImageEvent extends SplashEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
		public function LoadImageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LoadImageEvent = new LoadImageEvent( type );
			return e;
		}
	}
}