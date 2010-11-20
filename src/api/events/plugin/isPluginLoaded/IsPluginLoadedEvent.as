package api.events.plugin.isPluginLoaded
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class IsPluginLoadedEvent extends PluginEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PLUGIN_NAME_OR_ALIAS:String = "missingPluginNameOrAlias";
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