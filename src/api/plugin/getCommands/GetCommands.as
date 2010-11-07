package api.plugin.getCommands
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.plugin.getCommands.GetCommandsEvent;
	import api.plugin.Plugin;
	
	[Event( name="complete" , type="GetCommandsEvent")]
	[Event( name="missingAlias" , type="GetCommandsEvent")]
	[Event( name="result" , type="GetCommandsEvent")]
	[Event( name="getCommandsError" , type="PluginError")]
	[Event(name="result", type="api.events.plugin.getCommands.GetCommandsEvent")]
	[Bindable]
	public class GetCommands extends Plugin
	{
		// Required
		public var alias:String = null;
		
		// Result
		public var commands:Array = null;
		
		public function GetCommands(target:IEventDispatcher=null)
		{
			super(target);
		}
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
		override protected function sendResult( r:Object ):void
		{
			commands = r.result.split( COMMA );
			
			var e : GetCommandsEvent = new GetCommandsEvent( GetCommandsEvent.RESULT );
			e.commands = commands;
			dispatchEvent( e );
		}
	}
}