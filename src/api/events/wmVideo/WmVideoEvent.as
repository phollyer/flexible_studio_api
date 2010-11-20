package api.events.wmVideo
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class WmVideoEvent extends SWFStudioEvent
	{
		public function WmVideoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WmVideoEvent = new WmVideoEvent( type );
			return e;
		}
	}
}