package api.events.layout
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class LayoutEvent extends SWFStudioEvent
	{
		public function LayoutEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LayoutEvent = new LayoutEvent( type );
			return e;
		}
	}
}