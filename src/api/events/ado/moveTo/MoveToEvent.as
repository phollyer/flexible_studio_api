package api.events.ado.moveTo
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class MoveToEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NUMBER:String = "missingNumber";
		public static const RESULT:String = "result";
		
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveToEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MoveToEvent = new MoveToEvent( type );
			e.adoError = adoError;
			e.row = row;
			return e;
		}
	}
}