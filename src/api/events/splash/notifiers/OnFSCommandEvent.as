package api.events.splash.notifiers
{
	import flash.events.Event;
	
	import api.events.splash.SplashEvent;

	public class OnFSCommandEvent extends SplashEvent
	{
		public static const STATUS:String = "status";
		
		public var args:String = null;
		public var command:String = null;
		public var result:String = null;
		
		public function OnFSCommandEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnFSCommandEvent = new OnFSCommandEvent( type );
			e.args = args;
			e.command = command;
			e.result = result;
			return e;
		}
	}
}