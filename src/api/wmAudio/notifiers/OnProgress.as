package api.wmAudio.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmAudio.notifiers.OnProgressEvent;
	import api.wmAudio.WmAudio;
	
	[Event(name="result", type="api.events.wmAudio.onProgress.OnProgressEvent")]
	[Bindable]
	public class OnProgress extends WmAudio
	{		
		// Result
		public var data:String = null
		
		public function OnProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onProgress"}
							 	 	 ,{callback:actionComplete, errorSTR:"onProgressError", code:"45015"} );
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