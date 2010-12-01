package api.ftp.bufferSize
{
	import api.events.ftp.bufferSize.BufferSizeEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_bufferSize.html Northcode Help Documentation
	*/
	public class BufferSize extends Ftp
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>8192</code>
		*/
		public var size:Number = 8192;
		
		/**
		* Constructor for Ftp.BufferSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_bufferSize.html Northcode Help Documentation
		*/
		public function BufferSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_bufferSize.html Northcode Help Documentation
		*/
		public function bufferSize():void
		{
			ssCore.Ftp.bufferSize( {size:size}
								  ,{callback:actionComplete, errorSTR:"bufferSizeError", code:"7007"} );
		}
	}
}