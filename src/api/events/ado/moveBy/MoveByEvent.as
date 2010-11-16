package api.events.ado.moveBy
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class MoveByEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NUMBER:String = "missingNumber";
		public static const RESULT:String = "result";
		
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveByEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MoveByEvent = new MoveByEvent( type );
			e.adoError = adoError;
			e.row = row;
			return e;
		}
	}
}