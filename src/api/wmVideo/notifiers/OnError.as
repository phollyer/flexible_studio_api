package api.wmVideo.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmVideo.notifiers.OnErrorEvent;
	import api.wmVideo.WmVideo;
	
	[Event(name="result", type="api.events.wmVideo.onError.OnErrorEvent")]
	[Bindable]
	public class OnError extends WmVideo
	{		
		// Result
		public var data:String = null
		
		public function OnError(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onError"}
							 	 	 ,{callback:actionComplete, errorSTR:"onErrorError", code:"46020"} );
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result
			
			var e : OnErrorEvent = new OnErrorEvent( OnErrorEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}