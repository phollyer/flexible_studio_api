package api.fileSys.getFolderSize
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.getFolderSize.GetFolderSizeEvent;
	import api.fileSys.FileSys;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.getFolderSize.GetFolderSizeEvent")]
	[Bindable]
	public class GetFolderSize extends FileSys
	{
		// Required 
		public var path:String = null;
		
		// Results
		public var bytes:Number = 0;
		public var gigabytes:Number = 0;
		public var kilobytes:Number = 0;
		public var megabytes:Number = 0;
		
		public function GetFolderSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getFolderSize( folderPath:String = null ):void
		{
			path = compareStrings( folderPath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.getFolderSize( {path:path} 
												 ,{callback:actionComplete, errorSTR:"getFolderSizeError", code:"9026"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			bytes = Number( r.result );
			gigabytes = Number( r.gb );
			kilobytes = Number( r.kb );
			megabytes = Number( r.mb );
			
			var e : GetFolderSizeEvent = new GetFolderSizeEvent( GetFolderSizeEvent.RESULT );
			e.bytes = bytes;
			e.gigabytes = gigabytes;
			e.kilobytes = kilobytes;
			e.megabytes = megabytes;
			dispatchEvent( e );
		}
	}
}