package api.plugin.getManifest
{
	import api.events.plugin.getManifest.GetManifestEvent;

	import api.plugin.Plugin;

	import flash.events.IEventDispatcher;
	
	[Event( name="complete" , type="GetManifestEvent")]
	[Event( name="missingAlias" , type="GetManifestEvent")]
	[Event( name="result" , type="GetManifestEvent")]
	[Event( name="getManifestError" , type="PluginError")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.plugin.getManifest.GetManifestEvent.RESULT
	*/
	[Event(name="result", type="api.events.plugin.getManifest.GetManifestEvent")]
	/**
	* Dispatched if the Property <code>plugin</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PLUGIN
	*/
	[Event(name="missingPlugin", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getManifest.html Northcode Help Documentation
	*/
	public class GetManifest extends Plugin
	{
		// Required
		/**
		* 
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
		public var manifest:String = null;
		
		/**
		* Constructor for Plugin.GetManifest()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getManifest.html Northcode Help Documentation
		*/
		public function GetManifest(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param aliasName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getManifest.html Northcode Help Documentation
		*/
		public function getManifest( aliasName:String = null ):void
		{
			alias = compareStrings( aliasName , alias );
			
			switch( alias )
			{
				case null:
					missingPlugin();
					break;
				default:
					ssCore.Plugin.getManifest( {alias:alias}
											  ,{callback:actionComplete, errorSTR:"getManifestError", code:"30003"} );
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
			manifest = r.result;
			
			var e : GetManifestEvent = new GetManifestEvent( GetManifestEvent.RESULT );
			e.manifest = manifest;
			dispatchEvent( e );
		}
	}
}