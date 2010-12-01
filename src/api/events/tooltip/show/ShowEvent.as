package api.events.tooltip.show
{
	import flash.events.Event;
	
	import api.events.tooltip.TooltipEvent;

	public class ShowEvent extends TooltipEvent
	{
		
		public function ShowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowEvent = new ShowEvent( type );
			return e;
		}
	}
}