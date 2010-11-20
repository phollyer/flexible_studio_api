package api.sysTools.extractIcons
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysTools.extractIcons.ExtractIconsEvent;
	import api.sysTools.SysTools;
	
	[Event(name="missingFolder" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.sysTools.extractIcons.ExtractIconsEvent")]
	[Bindable]
	public class ExtractIcons extends SysTools
	{
		// Required
		public var folder:String = null;
		public var path:String = null;
		
		// Result
		public var icoFiles:Array = null;
		
		public function ExtractIcons(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function extractIcons( filePath:String = null , extractToFolder:String = null ):void
		{
			path = compareStrings( filePath , path );
			folder = compareStrings( extractToFolder , folder );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( folder )
					{
						case null:
							missingFolder();
							break;
						default:
							ssCore.SysTools.extractIcons( {path:path , folder:folder}
														 ,{callback:actionComplete, errorSTR:"extractIconsError", code:"39001"} );
					}
			}
		}

		override protected function sendResult( r:Object ):void
		{
			icoFiles = r.result.split( CR );
			
			var e : ExtractIconsEvent = new ExtractIconsEvent( ExtractIconsEvent.RESULT );
			e.icoFiles = icoFiles;
			dispatchEvent( e );
		}
	}
}