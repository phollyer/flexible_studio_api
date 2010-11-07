package api.events.ftp.direction
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class DirectionEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INCORRECT_VALUE:String = "incorrectValue";
		
		public function DirectionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DirectionEvent = new DirectionEvent( type );
			return e;
		}
	}
}