package api.ftp.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.ftp.notifiers.OnProgressEvent;
	import api.ftp.Ftp;

	[Event(name="result", type="api.events.ftp.onProgress.OnProgressEvent")]
	[Bindable]
	public class OnProgress extends Ftp
	{
		// Required		
		public var bytesTransferred:Number = 0;
		
		public function OnProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Ftp.setNotify( {event:"onProgress"}
								 ,{callback:actionComplete, errorSTR:"onProgressError", code:"7028"} );
		}
		}	
		override protected function sendResult( r:Object ):void
		{
			bytesTransferred = Number( r.result );
			
			var e : OnProgressEvent = new OnProgressEvent( OnProgressEvent.RESULT );
			e.bytesTransferred = bytesTransferred;
			dispatchEvent( e );
		}	
	}
}