package api.tcp.notifiers
{
	import api.events.tcp.notifiers.OnReceiveErrorEvent;

	import api.tcp.Tcp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.tcp.notifiers.OnReceiveErrorEvent.RESULT
	*/
	[Event(name="result", type="api.events.tcp.onReceiveError.OnReceiveErrorEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_onReceiveError.html Northcode Help Documentation
	*/
	public class OnReceiveError extends Tcp
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var errorMessage:String = null;
		
		/**
		* Constructor for Tcp.OnReceiveError()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_onReceiveError.html Northcode Help Documentation
		*/
		public function OnReceiveError(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tcp.setNotify( {event:"onReceiveError"}
							 	 ,{callback:actionComplete, errorSTR:"onReceiveErrorError", code:"40007"} );
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
			errorMessage = r.result;
			
			var e : OnReceiveErrorEvent = new OnReceiveErrorEvent( OnReceiveErrorEvent.RESULT );
			e.errorMessage = errorMessage;
			dispatchEvent( e );
		}
	}
}