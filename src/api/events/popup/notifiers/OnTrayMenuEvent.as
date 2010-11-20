package api.events.popup.notifiers
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class OnTrayMenuEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var data:String = null;
		
		public function OnTrayMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnTrayMenuEvent = new OnTrayMenuEvent( type );
			e.data = data;
			return e;
		}
	}
}