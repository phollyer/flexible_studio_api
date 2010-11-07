package api.http.resource
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Resource extends Http
	{
		// Required
		public var resourceTarget:String = null;
		
		public function Resource(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function resource( resourceSTR:String = null ):void
		{
			resourceTarget = compareStrings( resourceSTR , resourceTarget );
			
			switch( resourceTarget )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.Http.resource( {resource:resourceTarget}
										 ,{callback:actionComplete, errorSTR:"resourceError", code:"4029"} );
			}
		}
	}
}