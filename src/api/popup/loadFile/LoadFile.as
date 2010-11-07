package api.popup.loadFile
{
	import flash.events.IEventDispatcher;
	import api.popup.Popup;
	
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class LoadFile extends Popup
	{
		// Required
		public var name:String = null;
		public var path:String = null;
		
		public function LoadFile(target:IEventDispatcher=null)
		{
			super(target);
		}
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