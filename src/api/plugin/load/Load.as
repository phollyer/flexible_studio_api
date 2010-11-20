package api.plugin.load
{
	import flash.events.IEventDispatcher;
	import api.plugin.Plugin;
	
	[Event( name="complete" , type="LoadEvent")]
	[Event( name="missingAlias" , type="LoadEvent")]
	[Event( name="missingPlugin" , type="LoadEvent")]
	[Event( name="result" , type="LoadEvent")]
	[Event( name="loadError" , type="PluginError")]
	[Bindable]
	public class Load extends Plugin
	{
		// Required
		public var alias:String = null;
		public var plugin:String = null;
		
		public function Load(target:IEventDispatcher=null)
		{
			super(target);
		}
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