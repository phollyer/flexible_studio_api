package api.events.popup
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class PopupEvent extends SWFStudioEvent
	{
		public function PopupEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PopupEvent = new PopupEvent( type );
			return e;
		}
	}
}