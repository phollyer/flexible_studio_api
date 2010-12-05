package api.http.inputFile
{
	import api.events.http.inputFile.InputFileEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>name</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_NAME
	*/
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Allows you to provide files that should be sent with a POST request.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_inputFile.html Northcode Help Documentation
	*/
	public class InputFile extends Http
	{
		// Required
		/**
		* Field name(s) to associate with the supplied file(s). You can use the same name for all files (just supply one name) or a unique name for each file, separate each name by newlines ('\n').
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		/**
		* The local path(s) to the files that are to be posted, separated by newlines ('\n').
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for Http.InputFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_inputFile.html Northcode Help Documentation
		*/
		public function InputFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Allows you to provide files that should be sent with a POST request.
		*
		*
		* @param fieldName
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_inputFile.html Northcode Help Documentation
		*/
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