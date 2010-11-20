package api.fileSys.specialFolder
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.specialFolder.SpecialFolderEvent;
	import api.fileSys.FileSys;

	[Event(name="missingFolderID" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.specialFolder.SpecialFolderEvent")]
	[Bindable]
	public class SpecialFolder extends FileSys
	{
		// Required
		public var folderID:String = null;
		
		// Result
		public var folderPath:String = null;
		
		public function SpecialFolder(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function specialFolder( id:String = null ):void
		{
			folderID = compareStrings( id , folderID );
			
			switch( folderID )
			{
				case null:
					missingFolderID();
					break;
				default:
					ssCore.FileSys.specialFolder( {folderID:folderID}
												 ,{callback:actionComplete, errorSTR:"specialFolderError", code:"9035"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			folderPath = r.result;
			
			var e : SpecialFolderEvent = new SpecialFolderEvent( SpecialFolderEvent.RESULT );
			e.folderPath = folderPath;
			dispatchEvent( e );
		}
	}
}