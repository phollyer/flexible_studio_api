package api.events.ado.moveNext
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class MoveNextEvent extends AdoEvent
	{		
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveNextEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MoveNextEvent = new MoveNextEvent( type );
			e.adoError = adoError;
			e.row = row;
			return e;
		}
	}
}