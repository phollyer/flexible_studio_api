package api.events.wmVideo.setZoom
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetZoomEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetZoomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetZoomEvent = new SetZoomEvent( type );
			return e;
		}
	}
}