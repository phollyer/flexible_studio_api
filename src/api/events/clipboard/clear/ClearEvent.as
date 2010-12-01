package api.events.clipboard.clear
{
	import flash.events.Event;
	
	import api.events.clipboard.ClipboardEvent;

	public class ClearEvent extends ClipboardEvent
	{
		
		public function ClearEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearEvent = new ClearEvent( type );
			return e;
		}
	}
}