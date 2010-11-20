package api.http.method
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingMethod" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Method extends Http
	{
		// Required
		public var requestMethod:String = null;
		
		public function Method(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function method( methodSTR:String = null ):void
		{
			requestMethod = compareStrings( methodSTR , requestMethod );
			
			switch( requestMethod )
			{
				case null:
					missingMethod();
					break;
				default:
					ssCore.Http.method( {method:requestMethod}
									  ,{callback:actionComplete, errorSTR:"methodError", code:"4020"} );
			}
		}
	}
}