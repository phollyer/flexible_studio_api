package api.wmAudio.notifiers
{
	import api.events.wmAudio.notifiers.OnProgressEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmAudio.notifiers.OnProgressEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmAudio.onProgress.OnProgressEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_onProgress.html Northcode Help Documentation
	*/
	public class OnProgress extends WmAudio
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null
		
		/**
		* Constructor for WmAudio.OnProgress()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_onProgress.html Northcode Help Documentation
		*/
		public function OnProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onProgress"}
							 	 	 ,{callback:actionComplete, errorSTR:"onProgressError", code:"45015"} );
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
			
			var e : OnProgressEvent = new OnProgressEvent( OnProgressEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}