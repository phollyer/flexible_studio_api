package api.events.popup.showAt
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class ShowAtEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NAME:String = "missingName";
		public static const RESULT:String = "result";
		
		public var itemID:String = null;
		
		public function ShowAtEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowAtEvent = new ShowAtEvent( type );
			e.itemID = itemID;
			return e;
		}
	}
}