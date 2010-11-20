package api.wmVideo.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmVideo.notifiers.OnScriptCommandEvent;
	import api.wmVideo.WmVideo;
	
	[Event(name="result", type="api.events.wmVideo.onScriptCommand.OnScriptCommandEvent")]
	[Bindable]
	public class OnScriptCommand extends WmVideo
	{		
		// Result
		public var argument:String = null;
		public var commandType:String = null;
		
		public function OnScriptCommand(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onScriptCommand"}
							 	 	 ,{callback:actionComplete, errorSTR:"onScriptCommandError", code:"46023"} );
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