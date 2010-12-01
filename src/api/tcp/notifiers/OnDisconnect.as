package api.tcp.notifiers
{
	import api.events.tcp.notifiers.OnDisconnectEvent;

	import api.tcp.Tcp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.tcp.notifiers.OnDisconnectEvent.RESULT
	*/
	[Event(name="result", type="api.events.tcp.onDisconnect.OnDisconnectEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_onDisconnect.html Northcode Help Documentation
	*/
	public class OnDisconnect extends Tcp
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var message:String = null;
		
		/**
		* Constructor for Tcp.OnDisconnect()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_onDisconnect.html Northcode Help Documentation
		*/
		public function OnDisconnect(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tcp.setNotify( {event:"onDisconnect"}
							 	 ,{callback:actionComplete, errorSTR:"onDisconnectError", code:"40005"} );
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
			message = r.result;
			
			var e : OnDisconnectEvent = new OnDisconnectEvent( OnDisconnectEvent.RESULT );
			e.message = message;
			dispatchEvent( e );
		}
	}
}