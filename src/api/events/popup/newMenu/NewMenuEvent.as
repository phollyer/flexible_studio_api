package api.events.popup.newMenu
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class NewMenuEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NAME:String = "missingName";
		
		public function NewMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : NewMenuEvent = new NewMenuEvent( type );
			return e;
		}
	}
}