package api.http.getDefaultProxyPort
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.http.getDefaultProxyPort.GetDefaultProxyPortEvent;
	import api.http.Http;

	[Event(name="result", type="api.events.http.getDefaultProxyPort.GetDefaultProxyPortEvent")]
	[Bindable]
	public class GetDefaultProxyPort extends Http
	{
		// Result
		public var portNumber:Number = -1;
		
		public function GetDefaultProxyPort(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getDefaultProxyPort():void
		{
			ssCore.Http.getDefaultProxyPort( {}
								  			,{callback:actionComplete, errorSTR:"getDefaultProxyPortError", code:"4013"} );
		}
		override protected function sendResult( r:Object ):void
		{
			portNumber = r.result;
			
			var e : GetDefaultProxyPortEvent = new GetDefaultProxyPortEvent( GetDefaultProxyPortEvent.RESULT );
			e.portNumber = portNumber;
			dispatchEvent( e );
		}
	}
}