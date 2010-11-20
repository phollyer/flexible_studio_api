package api.udp.recvMsg
{
	import flash.events.IEventDispatcher;
	import api.udp.Udp;
	
	[Bindable]
	public class RecvMsg extends Udp
	{		
		public function RecvMsg(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function recvMsg():void
		{
			ssCore.Udp.recvMsg( {}
							   ,{callback:actionComplete, errorSTR:"recvMsgError", code:"44003"} );
		}
	}
}