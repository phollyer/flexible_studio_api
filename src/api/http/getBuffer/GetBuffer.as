package api.http.getBuffer
{
	import api.events.http.getBuffer.GetBufferEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.http.getBuffer.GetBufferEvent.RESULT
	*/
	[Event(name="result", type="api.events.http.getBuffer.GetBufferEvent")]
	[Bindable]
	/**
	* Retrieve the contents of the transfer buffer.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getBuffer.html Northcode Help Documentation
	*/
	public class GetBuffer extends Http
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var bufferContent:String = null;
		
		/**
		* Constructor for Http.GetBuffer()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getBuffer.html Northcode Help Documentation
		*/
		public function GetBuffer(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Retrieve the contents of the transfer buffer.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getBuffer.html Northcode Help Documentation
		*/
		public function getBuffer():void
		{
			ssCore.Http.getBuffer( {}
								  ,{callback:actionComplete, errorSTR:"getBufferError", code:"4005"} );
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
			bufferContent = r.result;
			
			var e : GetBufferEvent = new GetBufferEvent( GetBufferEvent.RESULT );
			e.bufferContent = bufferContent;
			dispatchEvent( e );
		}
	}
}