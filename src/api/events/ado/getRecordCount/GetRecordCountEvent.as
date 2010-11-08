package api.events.ado.getRecordCount
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class GetRecordCountEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var recordCount:Number = 0;
		
		public function GetRecordCountEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetRecordCountEvent = new GetRecordCountEvent( type );
			e.recordCount = recordCount;
			return e;
		}
	}
}