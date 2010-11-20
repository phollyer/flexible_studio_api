package api.events.popup.setText
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class SetTextEvent extends PopupEvent
	{
		
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