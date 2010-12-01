package api.events.flash
{
	import api.events.SWFStudioEvent;

	public class FlashEvent extends SWFStudioEvent
	{
		public function FlashEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}