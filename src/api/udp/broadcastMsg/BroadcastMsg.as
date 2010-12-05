package api.udp.broadcastMsg
{
	import api.events.udp.broadcastMsg.BroadcastMsgEvent;

	import api.udp.Udp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>data</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DATA
	*/
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Broadcasts the specified data (message) to all machines on the attached network, using the port specified in UDP.open.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_broadcastMsg.html Northcode Help Documentation
	*/
	public class BroadcastMsg extends Udp
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
		* Contents of the message, in hex string format, to broadcast on the network.
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Udp.BroadcastMsg()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_broadcastMsg.html Northcode Help Documentation
		*/
		public function BroadcastMsg(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Broadcasts the specified data (message) to all machines on the attached network, using the port specified in UDP.open.
		*
		*
		* @param msgData
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_broadcastMsg.html Northcode Help Documentation
		*/
		public function broadcastMsg( msgData:String = null ):void
		{
			data = compareStrings( msgData , data );
			
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.Udp.broadcastMsg( {data:data , addNull:addNull}
											,{callback:actionComplete, errorSTR:"broadcastMsgError", code:"44000"} );
			}
		}
	}
}