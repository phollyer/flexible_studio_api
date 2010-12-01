package api.events.plugin.getCommands
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class GetCommandsEvent extends PluginEvent
	{
		
	/**
	* The GetCommandsEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>commands</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
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