package api.wmVideo.notifiers
{
	import api.events.wmVideo.notifiers.OnScriptCommandEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmVideo.notifiers.OnScriptCommandEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmVideo.onScriptCommand.OnScriptCommandEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onScriptCommand.html Northcode Help Documentation
	*/
	public class OnScriptCommand extends WmVideo
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
		* Constructor for WmVideo.OnScriptCommand()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onScriptCommand.html Northcode Help Documentation
		*/
		public function OnScriptCommand(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onScriptCommand"}
							 	 	 ,{callback:actionComplete, errorSTR:"onScriptCommandError", code:"46023"} );
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