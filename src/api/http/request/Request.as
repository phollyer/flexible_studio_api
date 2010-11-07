package api.http.request
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Request extends Http
	{
		// Required
		public var data:String = null;
		
		public function Request(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function request( dataSTR:String = null ):void
		{
			data = compareStrings( dataSTR , data );
			
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.Http.request( {data:data}
										,{callback:actionComplete, errorSTR:"requestError", code:"4028"} );
			}
		}
	}
}