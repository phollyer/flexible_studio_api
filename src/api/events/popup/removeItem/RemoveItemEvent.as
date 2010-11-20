package api.events.popup.removeItem
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class RemoveItemEvent extends PopupEvent
	{
		
		public function RemoveItemEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RemoveItemEvent = new RemoveItemEvent( type );
			return e;
		}
	}
}