package api.fileSys.explore
{
	import api.events.fileSys.explore.ExploreEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

    [Event(name="complete", type="ExploreEvent")]
    [Event(name="missingPath", type="ExploreEvent")]
    [Event(name="exploreError", type="FileSys")]
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_explore.html Northcode Help Documentation
	*/
	public class Explore extends FileSys
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.Explore()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_explore.html Northcode Help Documentation
		*/
		public function Explore(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param folderPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_explore.html Northcode Help Documentation
		*/
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