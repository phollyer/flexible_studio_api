package api.events.wmVideo.pause
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class PauseEvent extends WmVideoEvent
	{
		
		public function PauseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PauseEvent = new PauseEvent( type );
			return e;
		}
	}
}