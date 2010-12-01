package api.wmVideo.notifiers
{
	import api.events.wmVideo.notifiers.OnCompleteEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmVideo.notifiers.OnCompleteEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmVideo.onComplete.OnCompleteEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onComplete.html Northcode Help Documentation
	*/
	public class OnComplete extends WmVideo
	{		
		/**
		* Constructor for WmVideo.OnComplete()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onComplete.html Northcode Help Documentation
		*/
		public function OnComplete(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onComplete"}
							 	 	 ,{callback:actionComplete, errorSTR:"onCompleteError", code:"46019"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			var e : OnCompleteEvent = new OnCompleteEvent( OnCompleteEvent.RESULT );
			dispatchEvent( e );
		}
	}
}