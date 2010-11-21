package api.events.plugin.getList
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class GetListEvent extends PluginEvent
	{
		/**
	* The GetListEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>plugins</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var plugins:XML = null;
		
		public function GetListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetListEvent = new GetListEvent( type );
			e.plugins = plugins;
			return e;
		}
	}
}