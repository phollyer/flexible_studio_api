package api.events.plugin.loadFromFolder
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class LoadFromFolderEvent extends PluginEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ALIAS:String = "missingAlias";
		public static const MISSING_PLUGIN:String = "missingPlugin";
		public static const MISSING_PATH:String = "missingPath";
		
		public function LoadFromFolderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LoadFromFolderEvent = new LoadFromFolderEvent( type );
			return e;
		}
	}
}