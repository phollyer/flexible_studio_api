package api.http.proxyPort
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingPort" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ProxyPort extends Http
	{
		// Required
		public var port:String = null;
		
		public function ProxyPort(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function proxyPort( portSTR:String = null ):void
		{
			port = compareStrings( portSTR , port );
			
			switch( port )
			{
				case null:
					missingPort();
					break;
				default:
					ssCore.Http.proxyPort( {port:port}
										  ,{callback:actionComplete, errorSTR:"proxyPortError", code:"4024"} );
			}
		}
	}
}