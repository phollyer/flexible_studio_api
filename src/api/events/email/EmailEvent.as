package api.events.email
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class EmailEvent extends SWFStudioEvent
	{
		public function EmailEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EmailEvent = new EmailEvent( type );
			return e;
		}
	}
}