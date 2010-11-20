package api.http.getContentLength
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.http.getContentLength.GetContentLengthEvent;
	import api.http.Http;

	[Event(name="result", type="api.events.http.getContentLength.GetContentLengthEvent")]
	[Bindable]
	public class GetContentLength extends Http
	{
		// Result
		public var totalBytes:Number = 0;
		
		public function GetContentLength(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getContentLength():void
		{
			ssCore.Http.getContentLength( {}
										 ,{callback:actionComplete, errorSTR:"getContentLengthError", code:"4002"} );
		}
		override protected function sendResult( r:Object ):void
		{
			totalBytes = Number( r.result );
			var e : GetContentLengthEvent = new GetContentLengthEvent( GetContentLengthEvent.RESULT );
			e.totalBytes = totalBytes;
			dispatchEvent( e );
		}
	}
}