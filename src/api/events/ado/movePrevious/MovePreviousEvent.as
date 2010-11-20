package api.events.ado.movePrevious
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class MovePreviousEvent extends AdoEvent
	{		
		public var adoError:String = null;
		public var row:String = null;
		
		public function MovePreviousEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MovePreviousEvent = new MovePreviousEvent( type );
			e.adoError = adoError;
			e.row = row;
			return e;
		}
	}
}