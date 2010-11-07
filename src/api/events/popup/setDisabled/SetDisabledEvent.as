package api.events.popup.setDisabled
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class SetDisabledEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_FLAG:String = "invalidFlag";
		public static const MISSING_FLAG:String = "missingFlag";
		public static const MISSING_ID:String = "missingID";
		public static const MISSING_NAME:String = "missingName";
		
		public function SetDisabledEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetDisabledEvent = new SetDisabledEvent( type );
			return e;
		}
	}
}