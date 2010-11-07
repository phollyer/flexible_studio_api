package api.wmAudio.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmAudio.notifiers.OnScriptCommandEvent;
	import api.wmAudio.WmAudio;
	
	[Event(name="result", type="api.events.wmAudio.onScriptCommand.OnScriptCommandEvent")]
	[Bindable]
	public class OnScriptCommand extends WmAudio
	{		
		// Result
		public var argument:String = null;
		public var commandType:String = null;
		
		public function OnScriptCommand(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onScriptCommand"}
							 	 	 ,{callback:actionComplete, errorSTR:"onScriptCommandError", code:"45016"} );
		}
		override protected function sendResult( r:Object ):void
		{
			commandType = r.result.split( COMMA )[ 0 ];
			argument = r.result.split( COMMA )[ 1 ];
			
			var e : OnScriptCommandEvent = new OnScriptCommandEvent( OnScriptCommandEvent.RESULT );
			e.argument = argument;
			e.commandType = commandType;
			dispatchEvent( e );
		}
	}
}