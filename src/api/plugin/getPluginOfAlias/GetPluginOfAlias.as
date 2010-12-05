package api.plugin.getPluginOfAlias
{
	import api.events.plugin.getPluginOfAlias.GetPluginOfAliasEvent;

	import api.plugin.Plugin;

	import flash.events.IEventDispatcher;
	
	[Event( name="complete" , type="GetPluginOfAliasEvent")]
	[Event( name="missingAlias" , type="GetPluginOfAliasEvent")]
	[Event( name="result" , type="GetPluginOfAliasEvent")]
	[Event( name="getPluginOfAliasError" , type="PluginError")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.plugin.getPluginOfAlias.GetPluginOfAliasEvent.RESULT
	*/
	[Event(name="result", type="api.events.plugin.getPluginOfAlias.GetPluginOfAliasEvent")]
	/**
	* Dispatched if the Property <code>plugin</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PLUGIN
	*/
	[Event(name="missingPlugin", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Returns the name of the plugin that the given alias was created for.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getPluginOfAlias.html Northcode Help Documentation
	*/
	public class GetPluginOfAlias extends Plugin
	{
		// Required
		/**
		* The name of the alias for which you want to know its associated plugin name.
		*
		* @defaultValue <code>null</code>
		*/
		public var alias:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var pluginName:String = null;
		
		/**
		* Constructor for Plugin.GetPluginOfAlias()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getPluginOfAlias.html Northcode Help Documentation
		*/
		public function GetPluginOfAlias(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Returns the name of the plugin that the given alias was created for.
		*
		*
		* @param aliasName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getPluginOfAlias.html Northcode Help Documentation
		*/
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			pluginName = r.result;
			
			var e : GetPluginOfAliasEvent = new GetPluginOfAliasEvent( GetPluginOfAliasEvent.RESULT );
			e.pluginName = pluginName;
			dispatchEvent( e );
		}
	}
}