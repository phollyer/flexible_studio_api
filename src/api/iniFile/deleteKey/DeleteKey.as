package api.iniFile.deleteKey
{
	import api.events.iniFile.deleteKey.DeleteKeyEvent;

	import api.iniFile.IniFile;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>key</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_KEY
	*/
	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSection" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_deleteKey.html Northcode Help Documentation
	*/
	public class DeleteKey extends IniFile
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var key:String = null;
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
		* Constructor for IniFile.DeleteKey()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_deleteKey.html Northcode Help Documentation
		*/
		public function DeleteKey(target:IEventDispatcher=null)
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
		* @param keySTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_deleteKey.html Northcode Help Documentation
		*/
		public function deleteKey( pathSTR:String = null , sectionSTR:String = null , keySTR:String = null ):void
		{
			path = compareStrings( pathSTR , path );
			section = compareStrings( sectionSTR , section );
			key = compareStrings( keySTR , key );
			
			switch( key )
			{
				case null:
					missingKey();
					break;
				default:
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
									delKey();
							}
					}
			}
		}
		private function delKey():void
		{
			ssCore.IniFile.deleteKey( {key:key , path:path , section:section}
									 ,{callback:actionComplete, errorSTR:"deleteKeyError", code:"23000"} );
		}


	}
}