package api.ftp.notifiers
{
	import api.events.ftp.notifiers.OnProgressEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.ftp.notifiers.OnProgressEvent.RESULT
	*/
	[Event(name="result", type="api.events.ftp.onProgress.OnProgressEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_onProgress.html Northcode Help Documentation
	*/
	public class OnProgress extends Ftp
	{
		// Required		
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var bytesTransferred:Number = 0;
		
		/**
		* Constructor for Ftp.OnProgress()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_onProgress.html Northcode Help Documentation
		*/
		public function OnProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Ftp.setNotify( {event:"onProgress"}
								 ,{callback:actionComplete, errorSTR:"onProgressError", code:"7028"} );
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
			bytesTransferred = Number( r.result );
			
			var e : OnProgressEvent = new OnProgressEvent( OnProgressEvent.RESULT );
			e.bytesTransferred = bytesTransferred;
			dispatchEvent( e );
		}	
	}
}