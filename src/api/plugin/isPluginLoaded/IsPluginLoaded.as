package api.plugin.isPluginLoaded
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.plugin.isPluginLoaded.IsPluginLoadedEvent;
	import api.plugin.Plugin;
	
	[Event( name="complete" , type="IsPluginLoadedEvent")]
	[Event( name="missingPluginNameOrAlias" , type="IsPluginLoadedEvent")]
	[Event( name="result" , type="IsPluginLoadedEvent")]
	[Event( name="isPluginLoadedError" , type="PluginError")]
	[Event(name="result", type="api.events.plugin.isPluginLoaded.IsPluginLoadedEvent")]
	[Bindable]
	public class IsPluginLoaded extends Plugin
	{
		// Optional
		public var alias:String = null;
		public var plugin:String = null;
		
		// Result
		public var isLoaded:Boolean = false;
		
		public function IsPluginLoaded(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function isAliasLoaded( aliasName:String = null ):void
		{
			alias = compareStrings( aliasName , alias );
			
			switch( alias )
			{
				case null:
					missingPlugin();
					break;
				default:
					ssCore.Plugin.isPluginLoaded( {alias:alias}
												 ,{callback:actionComplete, errorSTR:"isPluginLoadedError", code:"30005"} );
			}
		}
		public function isPluginLoaded( pluginName:String = null ):void
		{
			plugin = compareStrings( pluginName , plugin );
			
			switch( plugin )
			{
				case null:
					missingPlugin();
					break;
				default:
					ssCore.Plugin.isPluginLoaded( {plugin:plugin}
											  	 ,{callback:actionComplete, errorSTR:"isPluginLoadedError", code:"30005"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			isLoaded = checkBoolean( r.result );
			
			var e : IsPluginLoadedEvent = new IsPluginLoadedEvent( IsPluginLoadedEvent.RESULT );
			e.isLoaded = isLoaded;
			dispatchEvent( e );
		}
	}
}