package api.fileSys.copyFileAsync
{
	import api.events.fileSys.copyFileAsync.CopyFileAsyncEvent;

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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_copyFileAsync.html Northcode Help Documentation
	*/
	public class CopyFileAsync extends FileSys
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var failIfExists:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>8192</code>
		*/
		public var chunkSize:Number = 8192;
		
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
		* Constructor for FileSys.CopyFileAsync()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_copyFileAsync.html Northcode Help Documentation
		*/
		public function CopyFileAsync(target:IEventDispatcher=null)
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
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_copyFileAsync.html Northcode Help Documentation
		*/
		public function copyFileAsync( fromSTR:String = null , toSTR:String = null ):void
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
			ssCore.FileSys.copyFileAsync( {from:fromPath , to:toPath , chunkSize:chunkSize , failIfExists:failIfExists}
									,{callback:actionComplete, errorSTR:"copyFileAsyncError", code:"9018"} );
		}

	}
}