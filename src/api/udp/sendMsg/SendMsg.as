package api.udp.sendMsg
{
	import flash.events.IEventDispatcher;
	import api.udp.Udp;
	
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingDestination" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendMsg extends Udp
	{
		// Optional
		public var addNull:Boolean = false;
		
		// Required
		public var data:String = null;
		public var destination:String = null;
		
		public function SendMsg(target:IEventDispatcher=null)
		{
			super(target);
		}
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