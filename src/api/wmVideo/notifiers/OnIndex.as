package api.wmVideo.notifiers
{
	import api.events.wmVideo.notifiers.OnIndexEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmVideo.notifiers.OnIndexEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmVideo.onIndex.OnIndexEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onIndex.html Northcode Help Documentation
	*/
	public class OnIndex extends WmVideo
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null
		
		/**
		* Constructor for WmVideo.OnIndex()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_onIndex.html Northcode Help Documentation
		*/
		public function OnIndex(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmVideo.setNotify( {event:"onIndex"}
							 	 	 ,{callback:actionComplete, errorSTR:"onIndexError", code:"46021"} );
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
			
			var e : OnIndexEvent = new OnIndexEvent( OnIndexEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}