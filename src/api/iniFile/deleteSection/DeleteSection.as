package api.iniFile.deleteSection
{
	import flash.events.IEventDispatcher;
	import api.iniFile.IniFile;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSection" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class DeleteSection extends IniFile
	{
		// Required
		public var path:String = null;
		public var section:String = null;
		
		public function DeleteSection(target:IEventDispatcher=null)
		{
			super(target);
		}
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