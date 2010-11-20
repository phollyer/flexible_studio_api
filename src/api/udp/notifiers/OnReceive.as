package api.udp.notifiers
{
	import api.events.udp.notifiers.OnReceiveEvent;

	import api.udp.Udp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.udp.notifiers.OnReceiveEvent.RESULT
	*/
	[Event(name="result", type="api.events.udp.onReceive.OnReceiveEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_onReceive.html Northcode Help Documentation
	*/
	public class OnReceive extends Udp
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var ipAddress:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var messageData:String = null;
		
		/**
		* Constructor for Udp.OnReceive()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_onReceive.html Northcode Help Documentation
		*/
		public function OnReceive(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Udp.setNotify( {event:"onReceive"}
							 	 ,{callback:actionComplete, errorSTR:"onReceiveError", code:"44005"} );
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
			ipAddress = r.result.split( COMMA )[ 0 ];
			messageData = r.result.split( COMMA )[ 1 ];
			
			var e : OnReceiveEvent = new OnReceiveEvent( OnReceiveEvent.RESULT );
			e.messageData = messageData;
			e.ipAddress = ipAddress;
			dispatchEvent( e );
		}
	}
}