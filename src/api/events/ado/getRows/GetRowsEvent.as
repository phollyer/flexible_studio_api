package api.events.ado.getRows
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class GetRowsEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var rows:String = null;
		
		public function GetRowsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetRowsEvent = new GetRowsEvent( type );
			e.rows = rows;
			return e;
		}
	}
}