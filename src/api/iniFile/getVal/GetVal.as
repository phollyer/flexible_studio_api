package api.iniFile.getVal
{
	import api.events.iniFile.getVal.GetValEvent;

	import api.iniFile.IniFile;

	import flash.events.IEventDispatcher;

	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_getVal.html Northcode Help Documentation
	*/
	public class GetVal extends IniFile
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
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var keyValue:String = null;
		
		/**
		* Constructor for IniFile.GetVal()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_getVal.html Northcode Help Documentation
		*/
		public function GetVal(target:IEventDispatcher=null)
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
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_INIFile_getVal.html Northcode Help Documentation
		*/
		public function getVal( pathSTR:String = null , sectionSTR:String = null , keySTR:String = null ):void
		{
			path = compareStrings( pathSTR , path );
			section = compareStrings( sectionSTR , section );
			key = compareStrings( keySTR , key );
			
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
									getKeyValue();
							}
					}
			}
		}
		private function getKeyValue():void
		{
			ssCore.IniFile.getVal( {path:path , section:section , key:key , defaultValue:defaultValue}
									,{callback:actionComplete, errorSTR:"getValError", code:"23004"} );
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
			keyValue = r.result;
			
			var e : GetValEvent = new GetValEvent( GetValEvent.RESULT );
			e.keyValue = keyValue;
			dispatchEvent( e );
		}
	}
}