package api.events.wmVideo.play
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class PlayEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function PlayEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PlayEvent = new PlayEvent( type );
			return e;
		}
	}
}