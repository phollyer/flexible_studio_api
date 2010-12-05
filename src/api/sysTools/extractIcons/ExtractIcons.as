package api.sysTools.extractIcons
{
	import api.events.sysTools.extractIcons.ExtractIconsEvent;

	import api.sysTools.SysTools;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>folder</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_FOLDER
	*/
	[Event(name="missingFolder" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysTools.extractIcons.ExtractIconsEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysTools.extractIcons.ExtractIconsEvent")]
	[Bindable]
	/**
	* Extract all ICON resources from an executable file or DLL.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_extractIcons.html Northcode Help Documentation
	*/
	public class ExtractIcons extends SysTools
	{
		// Required
		/**
		* Folder where the icons will be extracted. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var folder:String = null;
		/**
		* Path to the EXE or DLL file. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var icoFiles:Array = null;
		
		/**
		* Constructor for SysTools.ExtractIcons()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_extractIcons.html Northcode Help Documentation
		*/
		public function ExtractIcons(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Extract all ICON resources from an executable file or DLL.
		*
		*
		* @param filePath
		*
		* @param extractToFolder
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_extractIcons.html Northcode Help Documentation
		*/
		public function extractIcons( filePath:String = null , extractToFolder:String = null ):void
		{
			path = compareStrings( filePath , path );
			folder = compareStrings( extractToFolder , folder );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( folder )
					{
						case null:
							missingFolder();
							break;
						default:
							ssCore.SysTools.extractIcons( {path:path , folder:folder}
														 ,{callback:actionComplete, errorSTR:"extractIconsError", code:"39001"} );
					}
			}
		}

		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			icoFiles = r.result.split( CR );
			
			var e : ExtractIconsEvent = new ExtractIconsEvent( ExtractIconsEvent.RESULT );
			e.icoFiles = icoFiles;
			dispatchEvent( e );
		}
	}
}