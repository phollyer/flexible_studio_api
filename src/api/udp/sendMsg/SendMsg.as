package api.udp.sendMsg
{
	import api.events.udp.sendMsg.SendMsgEvent;

	import api.udp.Udp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>data</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DATA
	*/
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Send a message using the open socket to a specific IP name or address, using the port specified in UDP.open.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_sendMsg.html Northcode Help Documentation
	*/
	public class SendMsg extends Udp
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var addNull:Boolean = false;
		
		// Required
		/**
		* Data, in hex string format, to send.
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		/**
		* IP address or network name to send to.
		*
		* @defaultValue <code>null</code>
		*/
		public var destination:String = null;
		
		/**
		* Constructor for Udp.SendMsg()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_sendMsg.html Northcode Help Documentation
		*/
		public function SendMsg(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Send a message using the open socket to a specific IP name or address, using the port specified in UDP.open.
		*
		*
		* @param msgData
		*
		* @param destinationIPAddress
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_sendMsg.html Northcode Help Documentation
		*/
		public function sendMsg( msgData:String = null , destinationIPAddress:String = null ):void
		{
			data = compareStrings( msgData , data );
			destination = compareStrings( destinationIPAddress , destination );
			
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					switch( destination )
					{
						case null:
							missingDestination();
							break;
						default:
							ssCore.Udp.sendMsg( {data:data , destination:destination , addNull:addNull}
											   ,{callback:actionComplete, errorSTR:"sendMsgError", code:"44004"} );
					}
			}
		}

	}
}