package api.events.plugin.getPluginOfAlias
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class GetPluginOfAliasEvent extends PluginEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ALIAS:String = "missingAlias";
		public static const RESULT:String = "result";
		
		public var pluginName:String = null;
		
		public function GetPluginOfAliasEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetPluginOfAliasEvent = new GetPluginOfAliasEvent( type );
			e.pluginName = pluginName;
			return e;
		}
	}
}