package api.events.shell.launch
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class LaunchEvent extends ShellEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function LaunchEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LaunchEvent = new LaunchEvent( type );
			return e;
		}
	}
}