package api.wmAudio.notifiers
{
	import api.events.wmAudio.notifiers.OnCompleteEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmAudio.notifiers.OnCompleteEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmAudio.onComplete.OnCompleteEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_onComplete.html Northcode Help Documentation
	*/
	public class OnComplete extends WmAudio
	{		
		/**
		* Constructor for WmAudio.OnComplete()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_onComplete.html Northcode Help Documentation
		*/
		public function OnComplete(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onComplete"}
							 	 	 ,{callback:actionComplete, errorSTR:"onCompleteError", code:"45012"} );
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