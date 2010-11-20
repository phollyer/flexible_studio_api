package api.wmAudio.notifiers
{
	import api.events.wmAudio.notifiers.OnErrorEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmAudio.notifiers.OnErrorEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmAudio.onError.OnErrorEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_onError.html Northcode Help Documentation
	*/
	public class OnError extends WmAudio
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null
		
		/**
		* Constructor for WmAudio.OnError()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_onError.html Northcode Help Documentation
		*/
		public function OnError(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onError"}
							 	 	 ,{callback:actionComplete, errorSTR:"onErrorError", code:"45013"} );
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
			data = r.result
			
			var e : OnErrorEvent = new OnErrorEvent( OnErrorEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}