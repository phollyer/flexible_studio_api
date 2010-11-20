package api.ftp.getFileSize
{
	import api.events.ftp.getFileSize.GetFileSizeEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.ftp.getFileSize.GetFileSizeEvent.RESULT
	*/
	[Event(name="result", type="api.events.ftp.getFileSize.GetFileSizeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getFileSize.html Northcode Help Documentation
	*/
	public class GetFileSize extends Ftp
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var size:Number = 0;
		
		/**
		* Constructor for Ftp.GetFileSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getFileSize.html Northcode Help Documentation
		*/
		public function GetFileSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getFileSize.html Northcode Help Documentation
		*/
		public function getFileSize():void
		{
			ssCore.Ftp.getFileSize( {}
								   ,{callback:actionComplete, errorSTR:"getFileSizeError", code:"7015"} );
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
			size = Number( r.result );
			
			var e : GetFileSizeEvent = new GetFileSizeEvent( GetFileSizeEvent.RESULT );
			e.size = size;
			dispatchEvent( e );
		}
	}
}