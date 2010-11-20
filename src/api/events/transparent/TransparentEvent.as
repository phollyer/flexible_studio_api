package api.events.transparent
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class TransparentEvent extends KernelEvent
	{
		public function TransparentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : TransparentEvent = new TransparentEvent( type );
			return e;
		}
	}
}