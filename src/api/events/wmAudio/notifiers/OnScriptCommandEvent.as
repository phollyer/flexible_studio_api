package api.events.wmAudio.notifiers
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class OnScriptCommandEvent extends WmAudioEvent
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