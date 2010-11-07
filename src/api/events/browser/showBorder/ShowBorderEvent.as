package api.events.browser.showBorder
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class ShowBorderEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function ShowBorderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowBorderEvent = new ShowBorderEvent( type );
			return e;
		}	
	}
}