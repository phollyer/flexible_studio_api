package api.events.ado.moveLast
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class MoveLastEvent extends AdoEvent
	{		
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveLastEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MoveLastEvent = new MoveLastEvent( type );
			e.adoError = adoError;
			e.row = row;
			return e;
		}
	}
}