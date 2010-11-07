package api.wmAudio.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmAudio.notifiers.OnErrorEvent;
	import api.wmAudio.WmAudio;
	
	[Event(name="result", type="api.events.wmAudio.onError.OnErrorEvent")]
	[Bindable]
	public class OnError extends WmAudio
	{		
		// Result
		public var data:String = null
		
		public function OnError(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onError"}
							 	 	 ,{callback:actionComplete, errorSTR:"onErrorError", code:"45013"} );
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