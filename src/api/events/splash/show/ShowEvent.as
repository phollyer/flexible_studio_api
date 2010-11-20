package api.events.splash.show
{
	import flash.events.Event;
	
	import api.events.splash.SplashEvent;

	public class ShowEvent extends SplashEvent
	{
		public static const COMPLETE						:String 				= "complete";
		public static const MISSING_PATH					:String					= "missingPath";
		
		public function ShowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowEvent = new ShowEvent( type );
			return e;
		}
	}
}