package api.events.wmVideo.setFullscreen
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetFullscreenEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetFullscreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetFullscreenEvent = new SetFullscreenEvent( type );
			return e;
		}
	}
}