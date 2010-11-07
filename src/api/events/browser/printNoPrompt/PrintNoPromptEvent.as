package api.events.browser.printNoPrompt
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class PrintNoPromptEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function PrintNoPromptEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PrintNoPromptEvent = new PrintNoPromptEvent( type );
			return e;
		}
	}
}