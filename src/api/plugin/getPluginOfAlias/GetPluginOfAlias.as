package api.plugin.getPluginOfAlias
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.plugin.getPluginOfAlias.GetPluginOfAliasEvent;
	import api.plugin.Plugin;
	
	[Event( name="complete" , type="GetPluginOfAliasEvent")]
	[Event( name="missingAlias" , type="GetPluginOfAliasEvent")]
	[Event( name="result" , type="GetPluginOfAliasEvent")]
	[Event( name="getPluginOfAliasError" , type="PluginError")]
	[Event(name="result", type="api.events.plugin.getPluginOfAlias.GetPluginOfAliasEvent")]
	[Bindable]
	public class GetPluginOfAlias extends Plugin
	{
		// Required
		public var alias:String = null;
		
		// Result
		public var pluginName:String = null;
		
		public function GetPluginOfAlias(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getPluginOfAlias( aliasName:String = null ):void
		{
			alias = compareStrings( aliasName , alias );
			
			switch( alias )
			{
				case null:
					missingPlugin();
					break;
				default:
					ssCore.Plugin.getPluginOfAlias( {alias:alias}
											  ,{callback:actionComplete, errorSTR:"getPluginOfAliasError", code:"30004"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			pluginName = r.result;
			
			var e : GetPluginOfAliasEvent = new GetPluginOfAliasEvent( GetPluginOfAliasEvent.RESULT );
			e.pluginName = pluginName;
			dispatchEvent( e );
		}
	}
}