package api.ftp.getFileSize
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.ftp.getFileSize.GetFileSizeEvent;
	import api.ftp.Ftp;

	[Event(name="result", type="api.events.ftp.getFileSize.GetFileSizeEvent")]
	[Bindable]
	public class GetFileSize extends Ftp
	{
		// Result
		public var size:Number = 0;
		
		public function GetFileSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getFileSize():void
		{
			ssCore.Ftp.getFileSize( {}
								   ,{callback:actionComplete, errorSTR:"getFileSizeError", code:"7015"} );
		}
		override protected function sendResult( r:Object ):void
		{
			size = Number( r.result );
			
			var e : GetFileSizeEvent = new GetFileSizeEvent( GetFileSizeEvent.RESULT );
			e.size = size;
			dispatchEvent( e );
		}
	}
}