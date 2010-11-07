package api.events.guides
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class GuidesEvent extends KernelEvent
	{
		public function GuidesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GuidesEvent = new GuidesEvent( type );
			return e;
		}
	}
}