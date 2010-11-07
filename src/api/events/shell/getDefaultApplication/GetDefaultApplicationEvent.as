package api.events.shell.getDefaultApplication
{
	import flash.events.Event;
	
	import api.events.shell.ShellEvent;

	public class GetDefaultApplicationEvent extends ShellEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var applicationPath:String = null;
		
		public function GetDefaultApplicationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDefaultApplicationEvent = new GetDefaultApplicationEvent( type );
			e.applicationPath = applicationPath;
			return e;
		}
	}
}