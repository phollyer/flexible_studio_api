package api.udp.broadcastMsg
{
	import flash.events.IEventDispatcher;
	import api.udp.Udp;
	
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class BroadcastMsg extends Udp
	{
		// Optional
		public var addNull:Boolean = false;
		
		// Required
		public var data:String = null;
		
		public function BroadcastMsg(target:IEventDispatcher=null)
		{
			super(target);
		}
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