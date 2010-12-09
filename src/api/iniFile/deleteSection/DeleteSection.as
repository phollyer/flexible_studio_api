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
	* Delete the specified section and all keys in the section.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_deleteSection.html Northcode Help Documentation
	*/
	public class DeleteSection extends IniFile
	{
		// Required
		/**
		* A fully qualified path to the INI file. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		/**
		* The name of the section to be deleted.
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
		* Delete the specified section and all keys in the section.
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