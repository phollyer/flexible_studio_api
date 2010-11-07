package api.wmVideo.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmVideo.notifiers.OnProgressEvent;
	import api.wmVideo.WmVideo;
	
	[Event(name="result", type="api.events.wmVideo.onProgress.OnProgressEvent")]
	[Bindable]
	public class OnProgress extends WmVideo
	{		
		// Result
		public var data:String = null
		
		public function OnProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onProgress"}
							 	 	 ,{callback:actionComplete, errorSTR:"onProgressError", code:"46022"} );
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result
			
			var e : OnProgressEvent = new OnProgressEvent( OnProgressEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}