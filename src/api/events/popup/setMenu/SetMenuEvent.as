package api.events.popup.setMenu
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class SetMenuEvent extends PopupEvent
	{
		
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