package api.vos.ftp.getDirList
{
	[Bindable]
	public class GetDirListVO extends Object
	{
		public var fileDate:String = null;
		public var fileName:String = null;
		public var filePath:String = null;
		public var fileSize:Number = 0;
		public var isDir:Boolean = false;
		
		public function GetDirListVO()
		{
			super();
		}
		
	}
}