package api.fileSys.getFreeSpace
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.getFreeSpace.GetFreeSpaceEvent;
	import api.fileSys.FileSys;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.getFreeSpace.GetFreeSpaceEvent")]
	[Bindable]
	public class GetFreeSpace extends FileSys
	{
		// Required
		public var path:String = null;
		
		// Results
		public var kilobytes:Number = 0;
		
		public function GetFreeSpace(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getFreeSpace( driveLetterOrUNCPath:String = null ):void
		{
			path = compareStrings( driveLetterOrUNCPath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.getFreeSpace( {path:path}
												,{callback:actionComplete, errorSTR:"getFreeSpaceError", code:"9027"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			kilobytes = Number( r.result );
			
			var e : GetFreeSpaceEvent = new GetFreeSpaceEvent( GetFreeSpaceEvent.RESULT );
			e.kilobytes = kilobytes;
			dispatchEvent( e );
		}
	}
}