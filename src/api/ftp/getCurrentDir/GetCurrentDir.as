package api.ftp.getCurrentDir
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.ftp.getCurrentDir.GetCurrentDirEvent;
	import api.ftp.Ftp;

	[Event(name="result", type="api.events.ftp.getCurrentDir.GetCurrentDirEvent")]
	[Bindable]
	public class GetCurrentDir extends Ftp
	{
		// Result
		public var currentDir:String = null;
		
		public function GetCurrentDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getCurrentDir():void
		{
			ssCore.Ftp.getCurrentDir( {}
									 ,{callback:actionComplete, errorSTR:"getCurrentDirError", code:"7013"} );
		}
		override protected function sendResult( r:Object ):void
		{
			currentDir = r.result;
			
			var e : GetCurrentDirEvent = new GetCurrentDirEvent( GetCurrentDirEvent.RESULT );
			e.currentDir = currentDir;
			dispatchEvent( e );
		}
	}
}