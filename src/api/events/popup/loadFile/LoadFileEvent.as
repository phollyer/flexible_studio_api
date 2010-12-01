package api.events.popup.loadFile
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class LoadFileEvent extends PopupEvent
	{
		
		public function LoadFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LoadFileEvent = new LoadFileEvent( type );
			return e;
		}
	}
}