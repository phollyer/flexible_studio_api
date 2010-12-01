package api.events.win.showCaption
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class ShowCaptionEvent extends WinEvent
	{
		
		public function ShowCaptionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowCaptionEvent = new ShowCaptionEvent( type );
			return e;
		}
	}
}