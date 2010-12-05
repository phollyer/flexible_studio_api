package api.plugin.getAliasesOfPlugin
{
	import api.events.plugin.getAliasesOfPlugin.GetAliasesOfPluginEvent;

	import api.plugin.Plugin;

	import flash.events.IEventDispatcher;
	
	[Event( name="complete" , type="GetAliasesOfPluginEvent")]
	[Event( name="missingPlugin" , type="GetAliasesOfPluginEvent")]
	[Event( name="result" , type="GetAliasesOfPluginEvent")]
	[Event( name="getAliasesOfPluginError" , type="PluginError")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.plugin.getAliasesOfPlugin.GetAliasesOfPluginEvent.RESULT
	*/
	[Event(name="result", type="api.events.plugin.getAliasesOfPlugin.GetAliasesOfPluginEvent")]
	/**
	* Dispatched if the Property <code>plugin</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PLUGIN
	*/
	[Event(name="missingPlugin", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Returns a list of aliases that have been created for a particular plugin.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getAliasesOfPlugin.html Northcode Help Documentation
	*/
	public class GetAliasesOfPlugin extends Plugin
	{
		// Required
		/**
		* The name of the plugin for which you want to see the array of aliases.
		*
		* @defaultValue <code>null</code>
		*/
		public var plugin:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var aliases:Array = null;
		
		/**
		* Constructor for Plugin.GetAliasesOfPlugin()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getAliasesOfPlugin.html Northcode Help Documentation
		*/
		public function GetAliasesOfPlugin(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Returns a list of aliases that have been created for a particular plugin.
		*
		*
		* @param pluginName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getAliasesOfPlugin.html Northcode Help Documentation
		*/
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			aliases = r.result.split( COMMA );
			
			var e : GetAliasesOfPluginEvent = new GetAliasesOfPluginEvent( GetAliasesOfPluginEvent.RESULT );
			e.aliases = aliases;
			dispatchEvent( e );
		}
	}
}