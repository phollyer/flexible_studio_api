package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnProgressEvent extends BrowserEvent
	{
		public static const STATUS:String = "status";
		
		public var bytesLoaded:Number = 0;
		public var bytesTotal:Number = 0;
		
		public function OnProgressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnProgressEvent = new OnProgressEvent( type );
			e.bytesLoaded = bytesLoaded;
			e.bytesTotal = bytesTotal;
			return e;
		}
	}
}