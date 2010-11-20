package api.wmAudio.notifiers
{
	import api.events.wmAudio.notifiers.OnScriptCommandEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmAudio.notifiers.OnScriptCommandEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmAudio.onScriptCommand.OnScriptCommandEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_onScriptCommand.html Northcode Help Documentation
	*/
	public class OnScriptCommand extends WmAudio
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var argument:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var commandType:String = null;
		
		/**
		* Constructor for WmAudio.OnScriptCommand()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_onScriptCommand.html Northcode Help Documentation
		*/
		public function OnScriptCommand(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onScriptCommand"}
							 	 	 ,{callback:actionComplete, errorSTR:"onScriptCommandError", code:"45016"} );
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
			commandType = r.result.split( COMMA )[ 0 ];
			argument = r.result.split( COMMA )[ 1 ];
			
			var e : OnScriptCommandEvent = new OnScriptCommandEvent( OnScriptCommandEvent.RESULT );
			e.argument = argument;
			e.commandType = commandType;
			dispatchEvent( e );
		}
	}
}