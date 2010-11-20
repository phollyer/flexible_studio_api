package api.http.getLastResponse
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.http.getLastResponse.GetLastResponseEvent;
	import api.http.Http;

	[Event(name="result", type="api.events.http.getLastResponse.GetLastResponseEvent")]
	[Bindable]
	public class GetLastResponse extends Http
	{
		// Result
		public var statusCode:String = null;
		public var statusDetails:String = null;
		
		public function GetLastResponse(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getLastResponse():void
		{
			ssCore.Http.getLastResponse( {}
								  		,{callback:actionComplete, errorSTR:"getLastResponseError", code:"4016"} );
		}
		override protected function sendResult( r:Object ):void
		{
			statusCode = r.result;
			statusDetails = r.details;
			
			var e : GetLastResponseEvent = new GetLastResponseEvent( GetLastResponseEvent.RESULT );
			e.statusCode = statusCode;
			e.statusDetails = statusDetails;
			dispatchEvent( e );
		}
	}
}