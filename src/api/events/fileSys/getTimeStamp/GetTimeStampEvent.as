package api.events.fileSys.getTimeStamp
{
	import flash.events.Event;

	public class GetTimeStampEvent extends Event
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var date:Date = null;
		public var hours:Number = -1;
		public var minutes:Number = -1;
		public var seconds:Number = -1;
		public var timeStamp:String = null;
		
		public function GetTimeStampEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e : GetTimeStampEvent = new GetTimeStampEvent( type );
			e.date = date;
			e.hours = hours;
			e.minutes = minutes;
			e.seconds = seconds;
			e.timeStamp = timeStamp;
			return e;
		}
	}
}