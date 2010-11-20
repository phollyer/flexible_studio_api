package api.http.inputFile
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class InputFile extends Http
	{
		// Required
		public var name:String = null;
		public var path:String = null;
		
		public function InputFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function inputFile( fieldName:String = null , filePath:String = null ):void
		{
			name = compareStrings( fieldName , name );
			path = compareStrings( filePath , path );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					switch( path )
					{
						case null:
							missingPath();
							break;
						default:
							ssCore.Http.inputFile( {name:name , path:path}
												  ,{callback:actionComplete, errorSTR:"inputFileError", code:"4019"} );
					}
			}
		}

	}
}