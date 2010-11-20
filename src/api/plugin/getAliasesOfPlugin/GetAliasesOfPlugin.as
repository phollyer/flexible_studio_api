package api.plugin.getAliasesOfPlugin
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.plugin.getAliasesOfPlugin.GetAliasesOfPluginEvent;
	import api.plugin.Plugin;
	
	[Event( name="complete" , type="GetAliasesOfPluginEvent")]
	[Event( name="missingPlugin" , type="GetAliasesOfPluginEvent")]
	[Event( name="result" , type="GetAliasesOfPluginEvent")]
	[Event( name="getAliasesOfPluginError" , type="PluginError")]
	[Event(name="result", type="api.events.plugin.getAliasesOfPlugin.GetAliasesOfPluginEvent")]
	[Bindable]
	public class GetAliasesOfPlugin extends Plugin
	{
		// Required
		public var plugin:String = null;
		
		// Result
		public var aliases:Array = null;
		
		public function GetAliasesOfPlugin(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getAliasesOfPlugin( pluginName:String = null ):void
		{
			plugin = compareStrings( pluginName , plugin );
			
			switch( plugin )
			{
				case null:
					missingPlugin();
					break;
				default:
					ssCore.Plugin.getAliasesOfPlugin( {plugin:plugin}
													 ,{callback:actionComplete, errorSTR:"getAliasesOfPluginError", code:"30000"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			aliases = r.result.split( COMMA );
			
			var e : GetAliasesOfPluginEvent = new GetAliasesOfPluginEvent( GetAliasesOfPluginEvent.RESULT );
			e.aliases = aliases;
			dispatchEvent( e );
		}
	}
}