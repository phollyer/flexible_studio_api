package api.wmVideo.notifiers
{
	import api.events.wmVideo.notifiers.OnErrorEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmVideo.notifiers.OnErrorEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmVideo.onError.OnErrorEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onError.html Northcode Help Documentation
	*/
	public class OnError extends WmVideo
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null
		
		/**
		* Constructor for WmVideo.OnError()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onError.html Northcode Help Documentation
		*/
		public function OnError(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onError"}
							 	 	 ,{callback:actionComplete, errorSTR:"onErrorError", code:"46020"} );
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