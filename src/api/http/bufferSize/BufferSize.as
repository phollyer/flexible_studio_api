package api.http.bufferSize
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Bindable]
	public class BufferSize extends Http
	{
		// Optional
		public var size:Number = 8192;
		
		public function BufferSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function bufferSize():void
		{
			ssCore.Http.bufferSize( {size:size}
								 ,{callback:actionComplete, errorSTR:"bufferSizeError", code:"4011"} );
		}
	}
}