package api.events.ado.move
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class MoveEvent extends AdoEvent
	{		
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MoveEvent = new MoveEvent( type );
			e.adoError = adoError;
			e.row = row;
			return e;
		}
	}
}