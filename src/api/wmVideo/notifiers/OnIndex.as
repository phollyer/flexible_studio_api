package api.wmVideo.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmVideo.notifiers.OnIndexEvent;
	import api.wmVideo.WmVideo;
	
	[Event(name="result", type="api.events.wmVideo.onIndex.OnIndexEvent")]
	[Bindable]
	public class OnIndex extends WmVideo
	{		
		// Result
		public var data:String = null
		
		public function OnIndex(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onIndex"}
							 	 	 ,{callback:actionComplete, errorSTR:"onIndexError", code:"46021"} );
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