package api.popup.loadFile
{
	import api.events.popup.loadFile.LoadFileEvent;

	import api.popup.Popup;

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
	* Create a new menu from previously saved menu definition file rather than adding all the menu items individually in code.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_loadFile.html Northcode Help Documentation
	*/
	public class LoadFile extends Popup
	{
		// Required
		/**
		* A name that you will use to refer to the new menu in all future menu commands.
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		/**
		* The fully qualified path to the file that contains the menu definition. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for Popup.LoadFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_loadFile.html Northcode Help Documentation
		*/
		public function LoadFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Create a new menu from previously saved menu definition file rather than adding all the menu items individually in code.
		*
		*
		* @param menuName
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_loadFile.html Northcode Help Documentation
		*/
		public function loadFile( menuName:String = null , filePath:String = null ):void
		{
			name = compareStrings( menuName , name );
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
							ssCore.Popup.loadFile( {name:name , path:path}
												  ,{callback:actionComplete, errorSTR:"loadFileError", code:"31003"} );
					}
			}
		}

	}
}