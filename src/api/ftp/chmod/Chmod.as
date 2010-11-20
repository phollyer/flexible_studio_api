package api.ftp.chmod
{
	import api.events.ftp.chmod.ChmodEvent;

	import api.ftp.Ftp;

	import api.vos.ftp.chmod.CHMODVO;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>remotePath</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_REMOTE_PATH
	*/
	[Event(name="missingRemotePath" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.ftp.chmod.ChmodEvent.RESULT
	*/
	[Event(name="result", type="api.events.ftp.chmod.ChmodEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_chmod.html Northcode Help Documentation
	*/
	public class Chmod extends Ftp
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var mode:CHMODVO = new CHMODVO();
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var remotePath:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var errorDetails:String = null;
		
		/**
		* Constructor for Ftp.Chmod()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_chmod.html Northcode Help Documentation
		*/
		public function Chmod(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param remotePathSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_chmod.html Northcode Help Documentation
		*/
		public function chmod( remotePathSTR:String = null ):void
		{
			remotePath = compareStrings( remotePathSTR , remotePath );
			
			switch( remotePath )
			{
				case null:
					missingRemotePath();
					break;
				default:
					setMode();
			}
		}
		private function setMode():void
		{
			var __mode:String = "";
			__mode = mode.user.getString();
			__mode += mode.group.getString();
			__mode += mode.other.getString();
			
			ssCore.Ftp.chmod( {mode:__mode , remotePath:remotePath}
							 ,{callback:actionComplete, errorSTR:"chmodError", code:"7009"} );
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
			errorDetails = r.errorsDetails;
			
			var e : ChmodEvent = new ChmodEvent( ChmodEvent.RESULT )
			e.errorsDetails = errorDetails;
			dispatchEvent( e );
		}
	}
}