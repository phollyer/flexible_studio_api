package api.wmAudio.notifiers
{
	import api.events.wmAudio.notifiers.OnIndexEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.wmAudio.notifiers.OnIndexEvent.RESULT
	*/
	[Event(name="result", type="api.events.wmAudio.onIndex.OnIndexEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_onIndex.html Northcode Help Documentation
	*/
	public class OnIndex extends WmAudio
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null
		
		/**
		* Constructor for WmAudio.OnIndex()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_onIndex.html Northcode Help Documentation
		*/
		public function OnIndex(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.WmAudio.setNotify( {event:"onIndex"}
							 	 	 ,{callback:actionComplete, errorSTR:"onIndexError", code:"45014"} );
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