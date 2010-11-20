package api.iniFile.enumSections
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.iniFile.enumSections.EnumSectionsEvent;
	import api.iniFile.IniFile;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.iniFile.enumSections.EnumSectionsEvent")]
	[Bindable]
	public class EnumSections extends IniFile
	{
		// Optional
		public var defaultValue:String = QUESTION;
		
		// Required
		public var path:String = null;
		
		// Result
		public var sections:Array = null;
		
		public function EnumSections(target:IEventDispatcher=null)
		{
			super(target);
		}
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
		override protected function sendResult( r:Object ):void
		{
			sections = r.result.split( COMMA );
			
			var e : EnumSectionsEvent = new EnumSectionsEvent( EnumSectionsEvent.RESULT );
			e.sections = sections;
			dispatchEvent( e );
		}
	}
}