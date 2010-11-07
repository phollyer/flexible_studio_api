package api.fileSys.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.notifiers.OnCopyProgressEvent;
	import api.fileSys.FileSys;

	[Event(name="result", type="api.events.fileSys.onCopyProgress.OnCopyProgressEvent")]
	[Bindable]
	public class OnCopyProgress extends FileSys
	{
		// Result
		public var bytesCopied:Number = 0;
		
		public function OnCopyProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.FileSys.setNotify( {event:"onCopyProgress"}
									 ,{callback:actionComplete, errorSTR:"onCopyProgressError", code:"9041"} );
		}
		override protected function sendResult( r:Object ):void
		{
			bytesCopied = Number( r.result );
			
			var e : OnCopyProgressEvent = new OnCopyProgressEvent( OnCopyProgressEvent.RESULT );
			e.bytesCopied = bytesCopied;
			dispatchEvent( e );
		}
	}
}