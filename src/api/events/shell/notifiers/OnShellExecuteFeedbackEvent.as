package api.events.shell.notifiers
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class OnShellExecuteFeedbackEvent extends ShellEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var data:Object = null;
		
		public function OnShellExecuteFeedbackEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnShellExecuteFeedbackEvent = new OnShellExecuteFeedbackEvent( type );
			e.data = data;
			return e;
		}
	}
}