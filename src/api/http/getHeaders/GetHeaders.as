package api.http.getHeaders
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.http.getHeaders.GetHeadersEvent;
	import api.http.Http;

	[Event(name="result", type="api.events.http.getHeaders.GetHeadersEvent")]
	[Bindable]
	public class GetHeaders extends Http
	{
		// Result
		public var headers:Array = null;
		
		public function GetHeaders(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getHeaders():void
		{
			ssCore.Http.getHeaders( {}
								   ,{callback:actionComplete, errorSTR:"getHeadersError", code:"4015"} );
		}
		override protected function sendResult( r:Object ):void
		{
			headers = r.result.split( NEW_LINE );
			
			var e : GetHeadersEvent = new GetHeadersEvent( GetHeadersEvent.RESULT );
			e.headers = headers;
			dispatchEvent( e );
		}
	}
}