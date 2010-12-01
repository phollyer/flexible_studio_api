package api.udp.recvMsg
{
	import api.events.udp.recvMsg.RecvMsgEvent;

	import api.udp.Udp;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_recvMsg.html Northcode Help Documentation
	*/
	public class RecvMsg extends Udp
	{		
		/**
		* Constructor for Udp.RecvMsg()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_recvMsg.html Northcode Help Documentation
		*/
		public function RecvMsg(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_recvMsg.html Northcode Help Documentation
		*/
		public function recvMsg():void
		{
			ssCore.Udp.recvMsg( {}
							   ,{callback:actionComplete, errorSTR:"recvMsgError", code:"44003"} );
		}
	}
}