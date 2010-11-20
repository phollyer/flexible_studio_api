package api.ftp.chmod
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.ftp.chmod.ChmodEvent;
	import api.ftp.Ftp;
	import api.vos.ftp.chmod.ChmodVO;

	[Event(name="missingRemotePath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.ftp.chmod.ChmodEvent")]
	[Bindable]
	public class Chmod extends Ftp
	{
		// Optional
		public var mode:ChmodVO = new ChmodVO();
		
		// Required
		public var remotePath:String = null;
		
		// Result
		public var errorDetails:String = null;
		
		public function Chmod(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function chmod( remotePathSTR:String = null ):void
		{
			remotePath = compareStrings( remotePathSTR , remotePath );
			
			switch( remotePath )
			{
				case null:
					missingRemotePath();
					break;
				default:
					setMode();
			}
		}
		private function setMode():void
		{
			var __mode:String = "";
			__mode = mode.user.getString();
			__mode += mode.group.getString();
			__mode += mode.other.getString();
			
			ssCore.Ftp.chmod( {mode:__mode , remotePath:remotePath}
							 ,{callback:actionComplete, errorSTR:"chmodError", code:"7009"} );
		}
		override protected function sendResult( r:Object ):void
		{
			errorDetails = r.errorsDetails;
			
			var e : ChmodEvent = new ChmodEvent( ChmodEvent.RESULT )
			e.errorsDetails = errorDetails;
			dispatchEvent( e );
		}
	}
}