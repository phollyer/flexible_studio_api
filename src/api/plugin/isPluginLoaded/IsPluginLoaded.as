package api.plugin.isPluginLoaded
{
	import api.events.plugin.isPluginLoaded.IsPluginLoadedEvent;

	import api.plugin.Plugin;

	import flash.events.IEventDispatcher;
	
	[Event( name="complete" , type="IsPluginLoadedEvent")]
	[Event( name="missingPluginNameOrAlias" , type="IsPluginLoadedEvent")]
	[Event( name="result" , type="IsPluginLoadedEvent")]
	[Event( name="isPluginLoadedError" , type="PluginError")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.plugin.isPluginLoaded.IsPluginLoadedEvent.RESULT
	*/
	[Event(name="result", type="api.events.plugin.isPluginLoaded.IsPluginLoadedEvent")]
	/**
	* Dispatched if the Property <code>plugin</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PLUGIN
	*/
	[Event(name="missingPlugin", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Determine if a plugin is currently loaded.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_isPluginLoaded.html Northcode Help Documentation
	*/
	public class IsPluginLoaded extends Plugin
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var alias:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var plugin:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var isLoaded:Boolean = false;
		
		/**
		* Constructor for Plugin.IsPluginLoaded()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_isPluginLoaded.html Northcode Help Documentation
		*/
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
		/**
		* Determine if a plugin is currently loaded.
		*
		*
		* @param pluginName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_isPluginLoaded.html Northcode Help Documentation
		*/
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			isLoaded = checkBoolean( r.result );
			
			var e : IsPluginLoadedEvent = new IsPluginLoadedEvent( IsPluginLoadedEvent.RESULT );
			e.isLoaded = isLoaded;
			dispatchEvent( e );
		}
	}
}