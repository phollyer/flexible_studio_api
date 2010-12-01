package api.http.bufferSize
{
	import api.events.http.bufferSize.BufferSizeEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_bufferSize.html Northcode Help Documentation
	*/
	public class BufferSize extends Http
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>8192</code>
		*/
		public var size:Number = 8192;
		
		/**
		* Constructor for Http.BufferSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_bufferSize.html Northcode Help Documentation
		*/
		public function BufferSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_bufferSize.html Northcode Help Documentation
		*/
		public function bufferSize():void
		{
			ssCore.Http.bufferSize( {size:size}
								 ,{callback:actionComplete, errorSTR:"bufferSizeError", code:"4011"} );
		}
	}
}