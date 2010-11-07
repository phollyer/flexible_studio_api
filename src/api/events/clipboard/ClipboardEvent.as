package api.events.clipboard
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class ClipboardEvent extends KernelEvent
	{
		public function ClipboardEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClipboardEvent = new ClipboardEvent( type );
			return e;
		}
	}
}