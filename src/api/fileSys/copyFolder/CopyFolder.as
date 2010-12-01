package api.fileSys.copyFolder
{
	import api.events.fileSys.copyFolder.CopyFolderEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;	
	
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_copyFolder.html Northcode Help Documentation
	*/
	public class CopyFolder extends FileSys
	{
		// Required		
		public var fromPath:String = "";
		public var toPath:String = "";
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var failIfExists:Boolean = false;
		
		/**
		* Constructor for FileSys.CopyFolder()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_copyFolder.html Northcode Help Documentation
		*/
		public function CopyFolder(target:IEventDispatcher=null)
		{
			super(target);
		}
				
		/**
		*
		*
		*
		* @param fromSTR
		*
		* @param toSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_copyFolder.html Northcode Help Documentation
		*/
		public function copyFolder( fromSTR:String = null , toSTR:String = null ):void
		{
			fromPath = compareStrings( fromSTR , fromPath );
			toPath = compareStrings( toSTR , toPath );
			
			switch( fromPath )
			{
				case null:
					missingFromPath();
					break;
				default:
					switch( toPath )
					{
						case null:
							missingToPath();
							break;
						default:
							copy();
					}
			}
		}
		private function copy():void
		{
			ssCore.FileSys.copyFolder( {from:fromPath , to:toPath}
									  ,{callback:actionComplete, errorSTR:"copyFolderError", code:"9003"} );
		}

	}
}