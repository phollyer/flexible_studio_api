package api.tcp.listen
{
	import api.events.tcp.listen.ListenEvent;

	import api.tcp.Tcp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>port</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PORT
	*/
	[Event(name="missingPort" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Listen for an incoming TCP connection on the specified port.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_listen.html Northcode Help Documentation
	*/
	public class Listen extends Tcp
	{		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var localAddress:String = null;
		
		// Required
		public var port:Number = -1;
		
		/**
		* Constructor for Tcp.Listen()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_listen.html Northcode Help Documentation
		*/
		public function Listen(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Listen for an incoming TCP connection on the specified port.
		*
		*
		* @param portNumber
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_listen.html Northcode Help Documentation
		*/
		public function listen( portNumber:Number = -1 ):void
		{
			port = compareNumbers( portNumber , port );
			
			switch( port > -1 )
			{
				case false:
					missingPort();
					break;
				default:
					var __o:Object = new Object();
					__o.port = port;
					switch( localAddress != null )
					{
						case true:
							__o.localAddress = localAddress;
					}
					ssCore.Tcp.listen( __o
									 ,{callback:actionComplete, errorSTR:"listenError", code:"40001"} );
			}
		}
	}
}