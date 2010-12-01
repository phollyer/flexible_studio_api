package api.tcp.sendMsg
{
	import api.events.tcp.sendMsg.SendMsgEvent;

	import api.tcp.Tcp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>data</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DATA
	*/
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_sendMsg.html Northcode Help Documentation
	*/
	public class SendMsg extends Tcp
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
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null
		
		/**
		* Constructor for Tcp.SendMsg()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_sendMsg.html Northcode Help Documentation
		*/
		public function SendMsg(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param dataSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_sendMsg.html Northcode Help Documentation
		*/
		public function sendMsg( dataSTR:String = null ):void
		{
			data = compareStrings( dataSTR , data );
			
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.Tcp.sendMsg( {data:data , addNull:addNull}
									   ,{callback:actionComplete, errorSTR:"sendMsgError", code:"40003"} );
			}
		}
	}
}