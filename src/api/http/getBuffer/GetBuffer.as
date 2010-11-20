package api.http.getBuffer
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.http.getBuffer.GetBufferEvent;
	import api.http.Http;

	[Event(name="result", type="api.events.http.getBuffer.GetBufferEvent")]
	[Bindable]
	public class GetBuffer extends Http
	{
		// Result
		public var bufferContent:String = null;
		
		public function GetBuffer(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getBuffer():void
		{
			ssCore.Http.getBuffer( {}
								  ,{callback:actionComplete, errorSTR:"getBufferError", code:"4005"} );
		}
		override protected function sendResult( r:Object ):void
		{
			bufferContent = r.result;
			
			var e : GetBufferEvent = new GetBufferEvent( GetBufferEvent.RESULT );
			e.bufferContent = bufferContent;
			dispatchEvent( e );
		}
	}
}