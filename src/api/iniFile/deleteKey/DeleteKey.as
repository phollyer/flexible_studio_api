package api.iniFile.deleteKey
{
	import flash.events.IEventDispatcher;
	import api.iniFile.IniFile;
	
	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSection" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class DeleteKey extends IniFile
	{
		// Required
		public var key:String = null;
		public var path:String = null;
		public var section:String = null;
		
		public function DeleteKey(target:IEventDispatcher=null)
		{
			super(target);
		}
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