package api.fileSys.explore
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

    [Event(name="complete", type="ExploreEvent")]
    [Event(name="missingPath", type="ExploreEvent")]
    [Event(name="exploreError", type="FileSys")]
    [Bindable]
	public class Explore extends FileSys
	{
		// Required
		public var path:String = null;
		
		public function Explore(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function explore( folderPath:String = null ):void
		{
			path = compareStrings( folderPath , path );
			switch( folderPath )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.explore( {path:path}
										   ,{callback:actionComplete, errorSTR:"exploreError", code:"9021"} );
			}
		}
		private function exploreComplete( r:Object , c:Object , e:Object ):void
		{			
			switch( r.success )
			{
				case true:
					var event : ExploreEvent = new ExploreEvent( ExploreEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "9021";
					dispatchError( FileSysError.EXPLORE_ERROR , e );
			}
		}
	}
}