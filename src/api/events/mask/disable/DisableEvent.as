package api.events.mask.disable
{
	import flash.events.Event;
	
	import api.events.mask.MaskEvent;

	public class DisableEvent extends MaskEvent
	{
		
		public function DisableEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DisableEvent = new DisableEvent( type );
			return e;
		}
	}
}