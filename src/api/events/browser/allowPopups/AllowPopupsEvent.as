package api.events.browser.allowPopups
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class AllowPopupsEvent extends BrowserEvent
	{
		
		public var status:Boolean;
		
		public function AllowPopupsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AllowPopupsEvent = new AllowPopupsEvent( type );
			e.status = status;
			return e;
		}
	}
}