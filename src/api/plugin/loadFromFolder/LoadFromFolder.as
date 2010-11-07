package api.plugin.loadFromFolder
{
	import flash.events.IEventDispatcher;
	import api.plugin.Plugin;
	
	[Event( name="complete" , type="LoadFromFolderEvent")]
	[Event( name="missingAlias" , type="LoadFromFolderEvent")]
	[Event( name="missingPath" , type="LoadFromFolderEvent")]
	[Event( name="missingPlugin" , type="LoadFromFolderEvent")]
	[Event( name="result" , type="LoadFromFolderEvent")]
	[Event( name="loadFromFolderError" , type="PluginError")]
	[Bindable]
	public class LoadFromFolder extends Plugin
	{
		// Required
		public var alias:String = null;
		public var path:String = null;
		public var plugin:String = null;
		
		public function LoadFromFolder(target:IEventDispatcher=null)
		{
			super(target);
		}
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