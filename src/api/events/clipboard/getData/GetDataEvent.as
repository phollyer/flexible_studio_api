package api.events.clipboard.getData
{
	import flash.events.Event;
	
	import api.events.clipboard.ClipboardEvent;

	public class GetDataEvent extends ClipboardEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var data:Object = null;
		public var dataType:Object = null;
		
		public function GetDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDataEvent = new GetDataEvent( type );
			e.data = data;
			e.dataType = dataType
			return e;
		}
	}
}