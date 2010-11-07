package api.events.tooltip
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class TooltipEvent extends KernelEvent
	{
		public function TooltipEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : TooltipEvent = new TooltipEvent( type );
			return e;
		}
	}
}