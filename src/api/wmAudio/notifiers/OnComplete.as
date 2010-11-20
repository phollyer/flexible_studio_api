package api.wmAudio.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmAudio.notifiers.OnCompleteEvent;
	import api.wmAudio.WmAudio;
	
	[Event(name="result", type="api.events.wmAudio.onComplete.OnCompleteEvent")]
	[Bindable]
	public class OnComplete extends WmAudio
	{		
		public function OnComplete(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onComplete"}
							 	 	 ,{callback:actionComplete, errorSTR:"onCompleteError", code:"45012"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var e : OnCompleteEvent = new OnCompleteEvent( OnCompleteEvent.RESULT );
			dispatchEvent( e );
		}
	}
}