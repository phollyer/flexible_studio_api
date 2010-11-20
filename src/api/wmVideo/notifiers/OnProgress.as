package api.wmVideo.notifiers
{
	import api.events.wmVideo.notifiers.OnProgressEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmVideo.notifiers.OnProgressEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmVideo.onProgress.OnProgressEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onProgress.html Northcode Help Documentation
	*/
	public class OnProgress extends WmVideo
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null
		
		/**
		* Constructor for WmVideo.OnProgress()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onProgress.html Northcode Help Documentation
		*/
		public function OnProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onProgress"}
							 	 	 ,{callback:actionComplete, errorSTR:"onProgressError", code:"46022"} );
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