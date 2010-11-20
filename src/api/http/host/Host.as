package api.http.host
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingHost" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Host extends Http
	{
		// Required
		public var hostName:String = null;
		
		public function Host(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function host( hostSTR:String = null ):void
		{
			hostName = compareStrings( hostSTR , hostName );
			
			switch( hostName )
			{
				case null:
					missingHost();
					break;
				default:
					ssCore.Http.host( {host:hostName}
									 ,{callback:actionComplete, errorSTR:"hostError", code:"4018"} );
			}
		}
	}
}