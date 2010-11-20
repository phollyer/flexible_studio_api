package api.iniFile.setVal
{
	import api.events.iniFile.setVal.SetValEvent;

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
	[Event(name="missingValue" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_setVal.html Northcode Help Documentation
	*/
	public class SetVal extends IniFile
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
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var value:String = null;
		
		/**
		* Constructor for IniFile.SetVal()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_setVal.html Northcode Help Documentation
		*/
		public function SetVal(target:IEventDispatcher=null)
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
		* @param valueSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_setVal.html Northcode Help Documentation
		*/
		public function setVal( pathSTR:String = null , sectionSTR:String = null , keySTR:String = null , valueSTR:String = null ):void
		{
			path = compareStrings( pathSTR , path );
			section = compareStrings( sectionSTR , section );
			key = compareStrings( keySTR , key );
			value = compareStrings( valueSTR , value );
			
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
							switch( key )
							{
								case null:
									missingKey();
									break;
								default:
									switch( value )
									{
										case null:
											missingValue();
											break;
										default:
											setValue();
									}
							}
					}
			}
		}
		private function setValue():void
		{
			ssCore.IniFile.setVal( {path:path , section:section , key:key , value:value}
								  ,{callback:actionComplete, errorSTR:"setValError", code:"23005"} );
		}



	}
}