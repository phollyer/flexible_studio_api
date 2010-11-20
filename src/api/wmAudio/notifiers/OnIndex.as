package api.wmAudio.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmAudio.notifiers.OnIndexEvent;
	import api.wmAudio.WmAudio;
	
	[Event(name="result", type="api.events.wmAudio.onIndex.OnIndexEvent")]
	[Bindable]
	public class OnIndex extends WmAudio
	{		
		// Result
		public var data:String = null
		
		public function OnIndex(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onIndex"}
							 	 	 ,{callback:actionComplete, errorSTR:"onIndexError", code:"45014"} );
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result
			
			var e : OnIndexEvent = new OnIndexEvent( OnIndexEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}