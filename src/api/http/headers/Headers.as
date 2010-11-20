package api.http.headers
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingHeaders" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Headers extends Http
	{
		// Required
		public var headersList:Array = null;
		
		public function Headers(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function headers( headersArray:Array = null ):void
		{
			headersList = compareArrays( headersArray , headersList );
			
			switch( headersList )
			{
				case null:
					missingHeaders();
					break;
				default:
					var __headers:String = headersList.join( NEW_LINE ) + NEW_LINE;
					ssCore.Http.headers( {headers:__headers}
										,{callback:actionComplete, errorSTR:"headersError", code:"4017"} );
			}
		}
	}
}