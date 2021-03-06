package api.events.shell.notifiers
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class ClearNotifyEvent extends ShellEvent
	{
		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearNotifyEvent = new ClearNotifyEvent( type );
			return e;
		}
	}
}