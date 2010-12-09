package api.fileSys.copyFile
{
	import api.events.fileSys.copyFile.CopyFileEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>fromPath</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_FROM_PATH
	*/
	[Event(name="missingFromPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingToPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Copies an existing file to a new location and sends progress notifications at the specified intervals.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_copyFile.html Northcode Help Documentation
	*/
	public class CopyFile extends FileSys
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var failIfExists:Boolean = false;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var fromPath:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var toPath:String = null;
		
		/**
		* Constructor for FileSys.CopyFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_copyFile.html Northcode Help Documentation
		*/
		public function CopyFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Copies an existing file to a new location and sends progress notifications at the specified intervals.
		*
		*
		* @param fromSTR
		*
		* @param toSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_copyFile.html Northcode Help Documentation
		*/
		public function copyFile( fromSTR:String = null , toSTR:String = null ):void
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
			ssCore.FileSys.copyFile( {from:fromPath , to:toPath , failIfExists:failIfExists}
									,{callback:actionComplete, errorSTR:"copyFileError", code:"9018"} );
		}

	}
}