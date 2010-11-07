package api.ftp.getLastResponse
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.ftp.getLastResponse.GetLastResponseEvent;
	import api.ftp.Ftp;

	[Event(name="result", type="api.events.ftp.getLastResponse.GetLastResponseEvent")]
	[Bindable]
	public class GetLastResponse extends Ftp
	{
		// Result 
		public var serverResponse:String = null;
		
		public function GetLastResponse(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getLastResponse():void
		{
			ssCore.Ftp.getLastResponse( {}
									   ,{callback:actionComplete, errorSTR:"getLastResponseError", code:"7016"} );
		}
		override protected function sendResult( r:Object ):void
		{
			serverResponse = r.result;
			
			var e : GetLastResponseEvent = new GetLastResponseEvent( GetLastResponseEvent.RESULT );
			e.serverResponse = serverResponse;
			dispatchEvent( e );
		}
	}
}