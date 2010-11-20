package api.events.shell
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class ShellEvent extends KernelEvent
	{		
		public function ShellEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShellEvent = new ShellEvent(type);
			return e;
		}
	}
}