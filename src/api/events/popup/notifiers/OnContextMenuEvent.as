package api.events.popup.notifiers
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class OnContextMenuEvent extends PopupEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var data:String = null;
		
		public function OnContextMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnContextMenuEvent = new OnContextMenuEvent( type );
			e.data = data;
			return e;
		}
	}
}