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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_loadFile.html Northcode Help Documentation
	*/
	public class LoadFile extends Popup
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		/**
		* 
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
		*
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