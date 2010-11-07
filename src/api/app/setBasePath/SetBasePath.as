package api.app.setBasePath
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetBasePath extends App
	{
		// Required
		public var path:String = null;
		
		public function SetBasePath(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setBasePath( basePath:String = null ):void
		{
			path = compareStrings( basePath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.App.setBasePath( {path:path} , {callback:actionComplete, errorSTR:"setBasePathError", code:"8015"} );
			}
		}
	}
}