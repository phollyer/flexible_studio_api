package api.plugin.getManifest
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.plugin.getManifest.GetManifestEvent;
	import api.plugin.Plugin;
	
	[Event( name="complete" , type="GetManifestEvent")]
	[Event( name="missingAlias" , type="GetManifestEvent")]
	[Event( name="result" , type="GetManifestEvent")]
	[Event( name="getManifestError" , type="PluginError")]
	[Event(name="result", type="api.events.plugin.getManifest.GetManifestEvent")]
	[Bindable]
	public class GetManifest extends Plugin
	{
		// Required
		public var alias:String = null;
		
		// Result
		public var manifest:String = null;
		
		public function GetManifest(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getManifest( aliasName:String = null ):void
		{
			alias = compareStrings( aliasName , alias );
			
			switch( alias )
			{
				case null:
					missingPlugin();
					break;
				default:
					ssCore.Plugin.getManifest( {alias:alias}
											  ,{callback:actionComplete, errorSTR:"getManifestError", code:"30003"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			manifest = r.result;
			
			var e : GetManifestEvent = new GetManifestEvent( GetManifestEvent.RESULT );
			e.manifest = manifest;
			dispatchEvent( e );
		}
	}
}