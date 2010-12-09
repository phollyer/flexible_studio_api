package api.plugin.unload
{
	import api.events.plugin.unload.UnloadEvent;

	import api.plugin.Plugin;

	import flash.events.IEventDispatcher;
	
	[Event( name="complete" , type="UnloadEvent")]
	[Event( name="missingAlias" , type="UnloadEvent")]
	[Event( name="result" , type="UnloadEvent")]
	[Event( name="unloadError" , type="PluginError")]
	/**
	* Dispatched if the Property <code>alias</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_ALIAS
	*/
	[Event(name="missingAlias", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Unload the specified instance of the plugin, when the last instance of the plugin has been unloaded the plugin will be removed from memory.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_unload.html Northcode Help Documentation
	*/
	public class Unload extends Plugin
	{
		// Required
		/**
		* The alias the plugin to be unloaded.
		*
		* @defaultValue <code>null</code>
		*/
		public var alias:String = null;
		
		/**
		* Constructor for Plugin.Unload()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_unload.html Northcode Help Documentation
		*/
		public function Unload(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Unload the specified instance of the plugin, when the last instance of the plugin has been unloaded the plugin will be removed from memory.
		*
		*
		* @param aliasName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_unload.html Northcode Help Documentation
		*/
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