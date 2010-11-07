package api.http.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.http.notifiers.OnProgressEvent;
	import api.http.Http;

	[Event(name="result", type="api.events.http.onProgress.OnProgressEvent")]
	[Bindable]
	public class OnProgress extends Http
	{
		// Result
		public var bytesTransferred:Number = 0;
		
		public function OnProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Http.setNotify( {event:"onProgress"}
								  ,{callback:actionComplete, errorSTR:"onProgressError", code:"4003"} );
		}
		override protected function sendResult( r:Object ):void
		{
			bytesTransferred = Number( r.result );
			
			var e : OnProgressEvent = new OnProgressEvent( OnProgressEvent.RESULT );
			e.bytesTransferred = bytesTransferred;
			dispatchEvent( e );
		}
	}
}