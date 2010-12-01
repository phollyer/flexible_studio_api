package api.iniFile.deleteSection
{
	import api.events.iniFile.deleteSection.DeleteSectionEvent;

	import api.iniFile.IniFile;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSection" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_deleteSection.html Northcode Help Documentation
	*/
	public class DeleteSection extends IniFile
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var section:String = null;
		
		/**
		* Constructor for IniFile.DeleteSection()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_deleteSection.html Northcode Help Documentation
		*/
		public function DeleteSection(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param pathSTR
		*
		* @param sectionSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_deleteSection.html Northcode Help Documentation
		*/
		public function deleteSection( pathSTR:String = null , sectionSTR:String = null ):void
		{
			path = compareStrings( pathSTR , path );
			section = compareStrings( sectionSTR , section );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( section )
					{
						case null:
							missingSection();
							break;
						default:
							delSection();
					}
			}
		}
		private function delSection():void
		{
			ssCore.IniFile.deleteSection( {path:path , section:section}
									 ,{callback:actionComplete, errorSTR:"deleteSectionError", code:"23001"} );
		}

	}
}