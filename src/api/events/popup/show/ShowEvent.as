package api.events.popup.show
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class ShowEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NAME:String = "missingName";
		public static const RESULT:String = "result";
		
		public var itemID:String = null;
		
		public function ShowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowEvent = new ShowEvent( type );
			e.itemID = itemID;
			return e;
		}
	}
}