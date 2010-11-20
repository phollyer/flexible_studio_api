package api.http.protocol
{
	import flash.events.IEventDispatcher;
	import api.http.Http;
	
	[Bindable]
	public class Protocol extends Http
	{
		// Optional
		public var serverProtocol:String = "http";
		
		public function Protocol(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function protocol():void
		{
			ssCore.Http.protocol( {protocol:serverProtocol}
								 ,{callback:actionComplete, errorSTR:"protocolError", code:"4023"} );
		}
	}
}