package api.events.tooltip.hide
{
	import flash.events.Event;
	
	import api.events.tooltip.TooltipEvent;

	public class HideEvent extends TooltipEvent
	{
		
		public function HideEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : HideEvent = new HideEvent( type );
			return e;
		}
	}
}