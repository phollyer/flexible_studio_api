package api.events.plugin.getManifest
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class GetManifestEvent extends PluginEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_ALIAS:String = "missingAlias";
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