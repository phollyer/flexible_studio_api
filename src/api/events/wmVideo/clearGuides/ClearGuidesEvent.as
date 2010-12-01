package api.events.wmVideo.clearGuides
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class ClearGuidesEvent extends WmVideoEvent
	{
		
		public function ClearGuidesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearGuidesEvent = new ClearGuidesEvent( type );
			return e;
		}
	}
}