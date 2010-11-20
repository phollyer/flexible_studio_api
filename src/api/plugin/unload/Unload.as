package api.plugin.unload
{
	import flash.events.IEventDispatcher;
	import api.plugin.Plugin;
	
	[Event( name="complete" , type="UnloadEvent")]
	[Event( name="missingAlias" , type="UnloadEvent")]
	[Event( name="result" , type="UnloadEvent")]
	[Event( name="unloadError" , type="PluginError")]
	[Bindable]
	public class Unload extends Plugin
	{
		// Required
		public var alias:String = null;
		
		public function Unload(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function unload( aliasName:String = null ):void
		{
			alias = compareStrings( aliasName , alias );
			
			switch( alias )
			{
				case null:
					missingAlias();
					break;
				default:
					ssCore.Plugin.unload( {alias:alias}
									     ,{callback:actionComplete, errorSTR:"unloadError", code:"30008"} );
			}
		}
	}
}