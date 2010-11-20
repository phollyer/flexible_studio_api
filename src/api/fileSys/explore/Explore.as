package api.fileSys.explore
{
	import api.events.fileSys.explore.ExploreEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

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
	}
}