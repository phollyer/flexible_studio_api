package api.events.popup
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class PopupEvent extends KernelEvent
	{
		public function PopupEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PopupEvent = new PopupEvent( type );
			return e;
		}
	}
}