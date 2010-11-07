package api.iniFile.setVal
{
	import flash.events.IEventDispatcher;
	import api.iniFile.IniFile;

	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingSection" , type="api.events.SWFStudioEvent")]
	[Event(name="missingValue" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetVal extends IniFile
	{
		// Required
		public var key:String = null;
		public var path:String = null;
		public var section:String = null;
		public var value:String = null;
		
		public function SetVal(target:IEventDispatcher=null)
		{
			super(target);
		}
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