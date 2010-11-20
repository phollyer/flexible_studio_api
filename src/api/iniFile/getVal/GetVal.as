package api.iniFile.getVal
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.iniFile.getVal.GetValEvent;
	import api.iniFile.IniFile;

	public class GetVal extends IniFile
	{
		// Optional
		public var defaultValue:String = QUESTION;
		
		// Required
		public var key:String = null;
		public var path:String = null;
		public var section:String = null;
		
		// Result
		public var keyValue:String = null;
		
		public function GetVal(target:IEventDispatcher=null)
		{
			super(target);
		}
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


		override protected function sendResult( r:Object ):void
		{
			keyValue = r.result;
			
			var e : GetValEvent = new GetValEvent( GetValEvent.RESULT );
			e.keyValue = keyValue;
			dispatchEvent( e );
		}
	}
}