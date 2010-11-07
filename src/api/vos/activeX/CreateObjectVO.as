package api.events.activeX
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class ActiveXEvent extends KernelEvent
	{
		public function ActiveXEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ActiveXEvent = new ActiveXEvent( type );
			return e;
		}
	}
}