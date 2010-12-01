package api.events.security.loadMainMovie
{
	import flash.events.Event;
	
	import api.events.security.SecurityEvent;

	public class LoadMainMovieEvent extends SecurityEvent
	{
		
		public function LoadMainMovieEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LoadMainMovieEvent = new LoadMainMovieEvent( type );
			return e;
		}
	}
}