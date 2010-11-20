package api.events.popup.setMenu
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class SetMenuEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NAME:String = "missingName";
		public static const MISSING_RESOURCE:String = "missingResource";
		
		public function SetMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetMenuEvent = new SetMenuEvent( type );
			return e;
		}
	}
}