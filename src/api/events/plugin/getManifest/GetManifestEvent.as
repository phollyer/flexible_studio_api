package api.events.plugin.getManifest
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class GetManifestEvent extends PluginEvent
	{
		
	/**
	* The GetManifestEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>manifest</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var manifest:String = null;
		
		public function GetManifestEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetManifestEvent = new GetManifestEvent( type );
			e.manifest = manifest;
			return e;
		}
	}
}