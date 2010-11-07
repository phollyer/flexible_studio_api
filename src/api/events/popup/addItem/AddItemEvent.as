package api.events.popup.addItem
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class AddItemEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ITEM:String = "missingItem";
		
		public function AddItemEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AddItemEvent = new AddItemEvent( type );
			return e;
		}
	}
}