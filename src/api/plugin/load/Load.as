package api.plugin.load
{
	import api.events.plugin.load.LoadEvent;

	import api.plugin.Plugin;

	import flash.events.IEventDispatcher;
	
	[Event( name="complete" , type="LoadEvent")]
	[Event( name="missingAlias" , type="LoadEvent")]
	[Event( name="missingPlugin" , type="LoadEvent")]
	[Event( name="result" , type="LoadEvent")]
	[Event( name="loadError" , type="PluginError")]
	/**
	* Dispatched if the Property <code>plugin</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PLUGIN
	*/
	[Event(name="missingPlugin", type="api.events.SWFStudioEvent")]
	[Event(name="missingAlias", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Load a new instance of the specified plugin and assign it an alias.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_load.html Northcode Help Documentation
	*/
	public class Load extends Plugin
	{
		// Required
		/**
		* The name that will be used to refer to this instance of the plugin.
		*
		* @defaultValue <code>null</code>
		*/
		public var alias:String = null;
		/**
		* The name of the plugin to be loaded as it appears in the Plugins tab.
		*
		* @defaultValue <code>null</code>
		*/
		public var plugin:String = null;
		
		/**
		* Constructor for Plugin.Load()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_load.html Northcode Help Documentation
		*/
		public function Load(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Load a new instance of the specified plugin and assign it an alias.
		*
		*
		* @param pluginName
		*
		* @param aliasName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_load.html Northcode Help Documentation
		*/
		public function load( pluginName:String = null , aliasName:String = null ):void
		{
			plugin = compareStrings( pluginName , plugin );
			alias = compareStrings( aliasName , alias );
			
			switch( plugin )
			{
				case null:
					missingPlugin();
					break;
				default:
					switch( alias )
					{
						case null:
							missingAlias();
							break;
						default:
							ssCore.Plugin.load( {plugin:plugin , alias:alias}
											   ,{callback:actionComplete, errorSTR:"loadError", code:"30006"} );
					}
			}
		}

	}
}