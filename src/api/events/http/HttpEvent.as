package api.events.http
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class HttpEvent extends KernelEvent
	{
		public function HttpEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var newEvent:HttpEvent = new HttpEvent(type);
			return newEvent;
		}
	}
}