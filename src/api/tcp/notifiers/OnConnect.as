package api.tcp.notifiers
{
	import api.events.tcp.notifiers.OnConnectEvent;

	import api.tcp.Tcp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.tcp.notifiers.OnConnectEvent.RESULT
	*/
	[Event(name="result", type="api.events.tcp.onConnect.OnConnectEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_onConnect.html Northcode Help Documentation
	*/
	public class OnConnect extends Tcp
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var destinationAddress:String = null;
		
		/**
		* Constructor for Tcp.OnConnect()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_onConnect.html Northcode Help Documentation
		*/
		public function OnConnect(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tcp.setNotify( {event:"onConnect"}
							 	 ,{callback:actionComplete, errorSTR:"onConnectError", code:"40004"} );
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
			destinationAddress = r.result;
			
			var e : OnConnectEvent = new OnConnectEvent( OnConnectEvent.RESULT );
			e.destinationAddress = destinationAddress;
			dispatchEvent( e );
		}
	}
}