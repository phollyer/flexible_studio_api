package api.iniFile.enumKeys
{
	import api.events.iniFile.enumKeys.EnumKeysEvent;

	import api.iniFile.IniFile;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSection" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.iniFile.enumKeys.EnumKeysEvent.RESULT
	*/
	[Event(name="result", type="api.events.iniFile.enumKeys.EnumKeysEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_enumKeys.html Northcode Help Documentation
	*/
	public class EnumKeys extends IniFile
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>QUESTION</code>
		*/
		public var defaultValue:String = QUESTION;
		
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
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var keys:Array = null;
		
		/**
		* Constructor for IniFile.EnumKeys()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_enumKeys.html Northcode Help Documentation
		*/
		public function EnumKeys(target:IEventDispatcher=null)
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
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_enumKeys.html Northcode Help Documentation
		*/
		public function enumKeys( pathSTR:String = null , sectionSTR:String = null ):void
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
							enum();
					}
			}
		}
		private function enum():void
		{
			ssCore.IniFile.enumKeys( {path:path , section:section , defaultValue:defaultValue}
									,{callback:actionComplete, errorSTR:"enumKeysError", code:"23002"} ); 
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
			keys = r.result.split( COMMA );
			
			var e : EnumKeysEvent = new EnumKeysEvent( EnumKeysEvent.RESULT );
			e.keys = keys;
			dispatchEvent( e );
		}
	}
}