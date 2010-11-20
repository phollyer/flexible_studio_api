package api.wmVideo.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmVideo.notifiers.OnCompleteEvent;
	import api.wmVideo.WmVideo;
	
	[Event(name="result", type="api.events.wmVideo.onComplete.OnCompleteEvent")]
	[Bindable]
	public class OnComplete extends WmVideo
	{		
		public function OnComplete(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onComplete"}
							 	 	 ,{callback:actionComplete, errorSTR:"onCompleteError", code:"46019"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var e : OnCompleteEvent = new OnCompleteEvent( OnCompleteEvent.RESULT );
			dispatchEvent( e );
		}
	}
}