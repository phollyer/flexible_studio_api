package api.events.tray.setTooltip
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class SetTooltipEvent extends TrayEvent
	{
		
		public function SetTooltipEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetTooltipEvent = new SetTooltipEvent( type );
			return e;
		}
	}
}