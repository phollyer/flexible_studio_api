package api.tcp.notifiers
{
	import api.events.tcp.notifiers.OnReceiveEvent;

	import api.tcp.Tcp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.tcp.notifiers.OnReceiveEvent.RESULT
	*/
	[Event(name="result", type="api.events.tcp.onReceive.OnReceiveEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_onReceive.html Northcode Help Documentation
	*/
	public class OnReceive extends Tcp
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var messageData:String = null;
		
		/**
		* Constructor for Tcp.OnReceive()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_onReceive.html Northcode Help Documentation
		*/
		public function OnReceive(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tcp.setNotify( {event:"onReceive"}
							 	 ,{callback:actionComplete, errorSTR:"onReceiveError", code:"40006"} );
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
			messageData = r.result;
			
			var e : OnReceiveEvent = new OnReceiveEvent( OnReceiveEvent.RESULT );
			e.messageData = messageData;
			dispatchEvent( e );
		}
	}
}