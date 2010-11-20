package api.fileSys.notifiers
{
	import api.events.fileSys.notifiers.OnCopyProgressEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.fileSys.notifiers.OnCopyProgressEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.onCopyProgress.OnCopyProgressEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_onCopyProgress.html Northcode Help Documentation
	*/
	public class OnCopyProgress extends FileSys
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var bytesCopied:Number = 0;
		
		/**
		* Constructor for FileSys.OnCopyProgress()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_onCopyProgress.html Northcode Help Documentation
		*/
		public function OnCopyProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.FileSys.setNotify( {event:"onCopyProgress"}
									 ,{callback:actionComplete, errorSTR:"onCopyProgressError", code:"9041"} );
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
			bytesCopied = Number( r.result );
			
			var e : OnCopyProgressEvent = new OnCopyProgressEvent( OnCopyProgressEvent.RESULT );
			e.bytesCopied = bytesCopied;
			dispatchEvent( e );
		}
	}
}