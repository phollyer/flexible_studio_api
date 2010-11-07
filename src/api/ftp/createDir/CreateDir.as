package api.ftp.createDir
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class CreateDir extends Ftp
	{
		// Required
		public var remotePath:String = null;
		
		public function CreateDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function createDir( dirPath:String = null ):void
		{
			remotePath = compareStrings( dirPath , remotePath );
			
			switch( remotePath )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Ftp.createDir( {remotePath:remotePath}
										 ,{callback:actionComplete, errorSTR:"createDirError", code:"7011"} );
			}
		}
	}
}