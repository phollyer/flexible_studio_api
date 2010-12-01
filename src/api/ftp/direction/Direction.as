package api.ftp.direction
{
	import api.events.ftp.direction.DirectionEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_direction.html Northcode Help Documentation
	*/
	public class Direction extends Ftp
	{
		public static const DOWNLOAD:String = "download";
		public static const UPLOAD:String = "upload";
		
		/**
		* 
		*
		* @defaultValue <code>DOWNLOAD</code>
		*/
		public var direction:String = DOWNLOAD;
		
		/**
		* Constructor for Ftp.Direction()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_direction.html Northcode Help Documentation
		*/
		public function Direction(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setDirection():void
		{
			switch( direction )
			{
				case DOWNLOAD:
				case UPLOAD:
					ssCore.Ftp.direction( {direction:direction}
										 ,{callback:actionComplete, errorSTR:"directionError", code:"7012"} );
					break;
				default:
					incorrectValue();
			}
		}
		private function incorrectValue():void
		{
			var e : DirectionEvent = new DirectionEvent( DirectionEvent.INVALID_VALUE );
			dispatchEvent( e );
		}
	}
}