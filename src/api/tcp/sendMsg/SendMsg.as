package api.tcp.sendMsg
{
	import flash.events.IEventDispatcher;
	import api.tcp.Tcp;
	
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendMsg extends Tcp
	{		
		// Optional
		public var addNull:Boolean = false;
		
		// Required
		public var data:String = null
		
		public function SendMsg(target:IEventDispatcher=null)
		{
			super(target);
		}
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