package api.http.getContentLength
{
	import api.events.http.getContentLength.GetContentLengthEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.http.getContentLength.GetContentLengthEvent.RESULT
	*/
	[Event(name="result", type="api.events.http.getContentLength.GetContentLengthEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getContentLength.html Northcode Help Documentation
	*/
	public class GetContentLength extends Http
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var totalBytes:Number = 0;
		
		/**
		* Constructor for Http.GetContentLength()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getContentLength.html Northcode Help Documentation
		*/
		public function GetContentLength(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getContentLength.html Northcode Help Documentation
		*/
		public function getContentLength():void
		{
			ssCore.Http.getContentLength( {}
										 ,{callback:actionComplete, errorSTR:"getContentLengthError", code:"4002"} );
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
			totalBytes = Number( r.result );
			var e : GetContentLengthEvent = new GetContentLengthEvent( GetContentLengthEvent.RESULT );
			e.totalBytes = totalBytes;
			dispatchEvent( e );
		}
	}
}