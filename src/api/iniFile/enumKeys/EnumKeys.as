package api.iniFile.enumKeys
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.iniFile.enumKeys.EnumKeysEvent;
	import api.iniFile.IniFile;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSection" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.iniFile.enumKeys.EnumKeysEvent")]
	[Bindable]
	public class EnumKeys extends IniFile
	{
		// Optional
		public var defaultValue:String = QUESTION;
		
		// Required
		public var path:String = null;
		public var section:String = null;
		
		// Result
		public var keys:Array = null;
		
		public function EnumKeys(target:IEventDispatcher=null)
		{
			super(target);
		}
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

		override protected function sendResult( r:Object ):void
		{
			keys = r.result.split( COMMA );
			
			var e : EnumKeysEvent = new EnumKeysEvent( EnumKeysEvent.RESULT );
			e.keys = keys;
			dispatchEvent( e );
		}
	}
}