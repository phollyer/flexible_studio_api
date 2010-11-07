package api.events.wmVideo.notifiers
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class OnScriptCommandEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var argument:String = null;
		public var commandType:String = null;
		
		public function OnScriptCommandEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnScriptCommandEvent = new OnScriptCommandEvent( type );
			e.argument = argument;
			e.commandType = commandType;
			return e;
		}
	}
}