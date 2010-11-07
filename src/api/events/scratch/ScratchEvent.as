package api.events.scratch
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class ScratchEvent extends KernelEvent
	{
		public function ScratchEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ScratchEvent = new ScratchEvent( type );
			return e;
		}
	}
}