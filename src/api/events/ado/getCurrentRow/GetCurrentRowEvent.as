package api.events.ado.getCurrentRow
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class GetCurrentRowEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var row:String = null;
		
		public function GetCurrentRowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetCurrentRowEvent = new GetCurrentRowEvent( type );
			e.row = row;
			return e;
		}
	}
}