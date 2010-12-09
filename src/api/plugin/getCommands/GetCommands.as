package api.plugin.getCommands
{
	import api.events.plugin.getCommands.GetCommandsEvent;

	import api.plugin.Plugin;

	import flash.events.IEventDispatcher;
	
	[Event( name="complete" , type="GetCommandsEvent")]
	[Event( name="missingAlias" , type="GetCommandsEvent")]
	[Event( name="result" , type="GetCommandsEvent")]
	[Event( name="getCommandsError" , type="PluginError")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.plugin.getCommands.GetCommandsEvent.RESULT
	*/
	[Event(name="result", type="api.events.plugin.getCommands.GetCommandsEvent")]
	/**
	* Dispatched if the Property <code>alias</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_ALIAS
	*/
	[Event(name="missingAlias", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Returns a comma delimited list of all the available plugin commands.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getCommands.html Northcode Help Documentation
	*/
	public class GetCommands extends Plugin
	{
		// Required
		/**
		* The alias that identifies an instance of a plugin.
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
		public var commands:Array = null;
		
		/**
		* Constructor for Plugin.GetCommands()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getCommands.html Northcode Help Documentation
		*/
		public function GetCommands(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Returns a comma delimited list of all the available plugin commands.
		*
		*
		* @param aliasName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Plugin_getCommands.html Northcode Help Documentation
		*/
		public function getCommands( aliasName:String = null ):void
		{
			alias = compareStrings( aliasName , alias );
			
			switch( alias )
			{
				case null:
					missingAlias();
					break;
				default:
					ssCore.Plugin.getCommands( {alias:alias}
											  ,{callback:actionComplete, errorSTR:"getCommandsError", code:"30001"} );
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
			commands = r.result.split( COMMA );
			
			var e : GetCommandsEvent = new GetCommandsEvent( GetCommandsEvent.RESULT );
			e.commands = commands;
			dispatchEvent( e );
		}
	}
}