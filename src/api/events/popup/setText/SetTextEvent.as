package api.events.popup.setText
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class SetTextEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ID:String = "missingID";
		public static const MISSING_NAME:String = "missingName";
		public static const MISSING_TEXT:String = "missingText";
		
		public function SetTextEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetTextEvent = new SetTextEvent( type );
			return e;
		}
	}
}