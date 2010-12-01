package api.iniFile.enumSections
{
	import api.events.iniFile.enumSections.EnumSectionsEvent;

	import api.iniFile.IniFile;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.iniFile.enumSections.EnumSectionsEvent.RESULT
	*/
	[Event(name="result", type="api.events.iniFile.enumSections.EnumSectionsEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_enumSections.html Northcode Help Documentation
	*/
	public class EnumSections extends IniFile
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
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var sections:Array = null;
		
		/**
		* Constructor for IniFile.EnumSections()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_enumSections.html Northcode Help Documentation
		*/
		public function EnumSections(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param pathSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_enumSections.html Northcode Help Documentation
		*/
		public function enumSections( pathSTR:String = null ):void
		{
			path = compareStrings( pathSTR , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.IniFile.enumSections( {path:path , defaultValue:defaultValue}
											,{callback:actionComplete, errorSTR:"enumSectionsError", code:"23003"} ); 
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
			sections = r.result.split( COMMA );
			
			var e : EnumSectionsEvent = new EnumSectionsEvent( EnumSectionsEvent.RESULT );
			e.sections = sections;
			dispatchEvent( e );
		}
	}
}