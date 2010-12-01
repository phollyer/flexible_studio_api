package api.tcp.notifiers
{
	import api.events.tcp.notifiers.OnSendErrorEvent;

	import api.tcp.Tcp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.tcp.notifiers.OnSendErrorEvent.RESULT
	*/
	[Event(name="result", type="api.events.tcp.onSendError.OnSendErrorEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_onSendError.html Northcode Help Documentation
	*/
	public class OnSendError extends Tcp
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var errorMessage:String = null;
		
		/**
		* Constructor for Tcp.OnSendError()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_onSendError.html Northcode Help Documentation
		*/
		public function OnSendError(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tcp.setNotify( {event:"onSendError"}
							 	 ,{callback:actionComplete, errorSTR:"onSendErrorError", code:"40008"} );
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
			
			var e : OnSendErrorEvent = new OnSendErrorEvent( OnSendErrorEvent.RESULT );
			e.errorMessage = errorMessage;
			dispatchEvent( e );
		}
	}
}