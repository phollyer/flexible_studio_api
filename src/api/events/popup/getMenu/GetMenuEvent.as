package api.events.popup.getMenu
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class GetMenuEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NAME:String = "missingName";
		public static const RESULT:String = "result";
		
		public var menu:String = null;
		
		public function GetMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetMenuEvent = new GetMenuEvent( type );
			e.menu = menu;
			return e;
		}
	}
}