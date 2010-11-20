package api.catalog.load
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Load extends Catalog
	{
		// Required
		public var path:String = null;
		
		public function Load(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function load( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Catalog.load( {path:path}
										,{callback:actionComplete, errorSTR:"loadError", code:"17006"} );
			}
		}
	}
}