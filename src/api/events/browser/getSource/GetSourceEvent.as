package api.events.browser.getSource
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class GetSourceEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var source:String = null;
		
		public function GetSourceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetSourceEvent = new GetSourceEvent( type );
			e.source = source;
			return e;
		}
	}
}