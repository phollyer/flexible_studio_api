package api.ftp.changeDir
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ChangeDir extends Ftp
	{
		// Required
		public var remotePath:String = null;
		
		public function ChangeDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function changeDir( remoteDirPath:String = null ):void
		{
			remotePath = compareStrings( remoteDirPath , remotePath );
			
			switch( remotePath )
			{
				case null:
					pathMissing();
					break;
				default:
					ssCore.Ftp.changeDir( {remotePath:remotePath}
										 ,{callback:actionComplete, errorSTR:"changeDirError", code:"7008"} );
			}
		}
		private function pathMissing():void
		{
			var e : ChangeDirEvent = new ChangeDirEvent( ChangeDirEvent.RESULT_PATH );
			dispatchEvent( e );
		}
	}
}