package api.plugin.loadFromFolder
{
	import api.events.plugin.loadFromFolder.LoadFromFolderEvent;

	import api.plugin.Plugin;

	import flash.events.IEventDispatcher;
	
	[Event( name="complete" , type="LoadFromFolderEvent")]
	[Event( name="missingAlias" , type="LoadFromFolderEvent")]
	[Event( name="missingPath" , type="LoadFromFolderEvent")]
	[Event( name="missingPlugin" , type="LoadFromFolderEvent")]
	[Event( name="result" , type="LoadFromFolderEvent")]
	[Event( name="loadFromFolderError" , type="PluginError")]
	/**
	* Dispatched if the Property <code>plugin</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PLUGIN
	*/
	[Event(name="missingPlugin", type="api.events.SWFStudioEvent")]
	[Event(name="missingAlias", type="api.events.SWFStudioEvent")]
	[Event(name="missingPath", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_loadFromFolder.html Northcode Help Documentation
	*/
	public class LoadFromFolder extends Plugin
	{
		// Required
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
		public var path:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var plugin:String = null;
		
		/**
		* Constructor for Plugin.LoadFromFolder()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_loadFromFolder.html Northcode Help Documentation
		*/
		public function LoadFromFolder(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param pluginName
		*
		* @param aliasName
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_loadFromFolder.html Northcode Help Documentation
		*/
		public function loadFromFolder( pluginName:String = null , aliasName:String = null , filePath:String = null ):void
		{
			plugin = compareStrings( pluginName , plugin );
			alias = compareStrings( aliasName , alias );
			path = compareStrings( filePath , path );
			
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
							switch( path )
							{
								case null:
									missingPath();
									break;
								default:
									ssCore.Plugin.loadFromFolder( {plugin:plugin , alias:alias , path:path}
													   			 ,{callback:actionComplete, errorSTR:"loadFromFolderError", code:"30007"} );
							}
					}
			}
		}


	}
}