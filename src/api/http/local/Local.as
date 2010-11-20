package api.http.local
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Local extends Http
	{
		// Required
		public var path:String = null;
		
		public function Local(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function local( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Http.local( {path:path}
									  ,{callback:actionComplete, errorSTR:"localError", code:"4007"} );
			}
		}
	}
}