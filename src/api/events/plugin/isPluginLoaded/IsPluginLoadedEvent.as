package api.events.plugin.isPluginLoaded
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class IsPluginLoadedEvent extends PluginEvent
	{
		
	/**
	* The IsPluginLoadedEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>isLoaded</td><td>false</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var isLoaded:Boolean = false;
		
		public function IsPluginLoadedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IsPluginLoadedEvent = new IsPluginLoadedEvent( type );
			e.isLoaded = isLoaded;
			return e;
		}
	}
}