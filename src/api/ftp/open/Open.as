package api.ftp.open
{
	import api.events.ftp.open.OpenEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.ftp.open.OpenEvent.RESULT
	*/
	[Event(name="result", type="api.events.ftp.open.OpenEvent")]
	[Bindable]
	/**
	* Begin an FTP transfer.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_open.html Northcode Help Documentation
	*/
	public class Open extends Ftp
	{
		public static const CLOSED:String = "closed";
		public static const OPEN:String = "open";
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var isOpen:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>CLOSED</code>
		*/
		public var status:String = CLOSED;
		
		/**
		* Constructor for Ftp.Open()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_open.html Northcode Help Documentation
		*/
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Begin an FTP transfer.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_open.html Northcode Help Documentation
		*/
		public function open():void
		{
			ssCore.Ftp.open( {}
							,{callback:actionComplete, errorSTR:"openError", code:"7019"} );
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
			isOpen = true;
			status = OPEN;
			
			var e : OpenEvent = new OpenEvent( OpenEvent.RESULT );
			e.isOpen = isOpen;
			e.status = status;
			dispatchEvent( e );
		}
	}
}