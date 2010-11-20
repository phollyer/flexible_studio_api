package api.events.plugin.getCommands
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class GetCommandsEvent extends PluginEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ALIAS:String = "missingAlias";
		public static const RESULT:String = "result";
		
		public var commands:Array = null;
		
		public function GetCommandsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetCommandsEvent = new GetCommandsEvent( type );
			e.commands = commands;
			return e;
		}	
	}
}