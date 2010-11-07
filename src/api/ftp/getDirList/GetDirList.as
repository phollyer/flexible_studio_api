package api.ftp.getDirList
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.ftp.getDirList.GetDirListEvent;
	import api.ftp.Ftp;
	import api.vos.ftp.getDirList.GetDirListVO;

	[Event(name="result", type="api.events.ftp.getDirList.GetDirListEvent")]
	[Bindable]
	public class GetDirList extends Ftp
	{
		// Optional
		public var pattern:String = "*";
		
		// Result
		public var dirList:Array = new Array();
		
		public function GetDirList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getDirList():void
		{
			ssCore.Ftp.getDirList( {pattern:pattern}
								  ,{callback:actionComplete, errorSTR:"getDirListError", code:"7014"} );
		}
		override protected function sendResult( r:Object ):void
		{
			dirList = new Array();
			var __results:Array = r.result.split( CR + NEW_LINE );
			for( var i:int = 0 ; i < __results.length ; i++ )
			{
				var __file:Array = __results[ i ].split( PIPE );
				var __vo:GetDirListVO = new GetDirListVO();
				__vo.fileDate = __file[ 2 ];
				__vo.fileName = __file[ 0 ];
				__vo.filePath = __file[ 3 ];
				__vo.fileSize = Number( __file[ 1 ] );
				__vo.isDir = checkBoolean( __file[ 4 ] );
				
				dirList.push( __vo );
			}
			
			var e : GetDirListEvent = new GetDirListEvent( GetDirListEvent.RESULT );
			e.dirList = dirList;
			dispatchEvent( e );
		}
	}
}