package api.events.flash
{
	import api.events.KernelEvent;

	public class FlashEvent extends KernelEvent
	{
		public function FlashEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}