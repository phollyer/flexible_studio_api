package api.ftp.removeDir
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Event(name="missingDirPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class RemoveDir extends Ftp
	{
		// Required
		public var remotePath:String = null;
		
		public function RemoveDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function removeDir( dirPath:String = null ):void
		{
			remotePath = compareStrings( dirPath , remotePath );
			
			switch( remotePath )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Ftp.removeDir( {remotePath:remotePath}
										 ,{callback:actionComplete, errorSTR:"removeDirError", code:"7023"} );
			}
		}
	}
}