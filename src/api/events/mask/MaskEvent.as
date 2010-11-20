package api.events.mask
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class MaskEvent extends KernelEvent
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