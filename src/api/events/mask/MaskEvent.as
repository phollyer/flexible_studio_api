package api.events.mask
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class MaskEvent extends SWFStudioEvent
	{
		public function MaskEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MaskEvent = new MaskEvent( type );
			return e;
		}
	}
}