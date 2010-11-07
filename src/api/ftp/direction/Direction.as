package api.ftp.direction
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Bindable]
	public class Direction extends Ftp
	{
		public static const DOWNLOAD:String = "download";
		public static const UPLOAD:String = "upload";
		
		public var direction:String = DOWNLOAD;
		
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
			var e : DirectionEvent = new DirectionEvent( DirectionEvent.RESULT_VALUE );
			dispatchEvent( e );
		}
	}
}