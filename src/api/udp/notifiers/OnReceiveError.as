package api.udp.notifiers
{
	import api.events.udp.notifiers.OnReceiveErrorEvent;

	import api.udp.Udp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.udp.notifiers.OnReceiveErrorEvent.RESULT
	*/
	[Event(name="result", type="api.events.udp.onReceiveError.OnReceiveErrorEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_onReceiveError.html Northcode Help Documentation
	*/
	public class OnReceiveError extends Udp
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var errorMessage:String = null;
		
		/**
		* Constructor for Udp.OnReceiveError()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_onReceiveError.html Northcode Help Documentation
		*/
		public function OnReceiveError(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Udp.setNotify( {event:"onReceiveError"}
							 	 ,{callback:actionComplete, errorSTR:"onReceiveErrorError", code:"44006"} );
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
			e.errorsMessage = errorMessage;
			dispatchEvent( e );
		}
	}
}