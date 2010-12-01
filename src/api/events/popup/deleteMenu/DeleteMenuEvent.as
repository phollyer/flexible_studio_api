package api.events.popup.deleteMenu
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class DeleteMenuEvent extends PopupEvent
	{
		
		public function DeleteMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DeleteMenuEvent = new DeleteMenuEvent( type );
			return e;
		}
	}
}