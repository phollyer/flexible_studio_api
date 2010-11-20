package api.http.notifiers
{
	import api.events.http.notifiers.OnProgressEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.http.notifiers.OnProgressEvent.RESULT
	*/
	[Event(name="result", type="api.events.http.onProgress.OnProgressEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_onProgress.html Northcode Help Documentation
	*/
	public class OnProgress extends Http
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var bytesTransferred:Number = 0;
		
		/**
		* Constructor for Http.OnProgress()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_onProgress.html Northcode Help Documentation
		*/
		public function OnProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Http.setNotify( {event:"onProgress"}
								  ,{callback:actionComplete, errorSTR:"onProgressError", code:"4003"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			bytesTransferred = Number( r.result );
			
			var e : OnProgressEvent = new OnProgressEvent( OnProgressEvent.RESULT );
			e.bytesTransferred = bytesTransferred;
			dispatchEvent( e );
		}
	}
}