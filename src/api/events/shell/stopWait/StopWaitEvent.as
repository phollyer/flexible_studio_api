package api.events.shell.stopWait
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class StopWaitEvent extends ShellEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function StopWaitEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : StopWaitEvent = new StopWaitEvent( type );
			return e;
		}
	}
}