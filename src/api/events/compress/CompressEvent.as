package api.events.compress
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class CompressEvent extends SWFStudioEvent
	{
		public function CompressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CompressEvent = new CompressEvent( type );
			return e;
		}
	}
}