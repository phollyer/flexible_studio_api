package api.events.popup.removeItem
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class RemoveItemEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NAME:String = "missingName";
		public static const MISSING_ID:String = "missingID";
		
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