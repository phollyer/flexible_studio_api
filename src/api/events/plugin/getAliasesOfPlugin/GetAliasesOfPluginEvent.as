package api.events.plugin.getAliasesOfPlugin
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class GetAliasesOfPluginEvent extends PluginEvent
	{
		
	/**
	* The GetAliasesOfPluginEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>aliases</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var aliases:Array = null;
		
		public function GetAliasesOfPluginEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetAliasesOfPluginEvent = new GetAliasesOfPluginEvent( type );
			e.aliases = aliases;
			return e;
		}
	}
}