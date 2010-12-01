package api.events.wmVideo.stop
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class StopEvent extends WmVideoEvent
	{
		
		public function StopEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : StopEvent = new StopEvent( type );
			return e;
		}
	}
}