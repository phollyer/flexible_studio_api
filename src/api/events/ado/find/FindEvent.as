package api.events.ado.find
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class FindEvent extends AdoEvent
	{		
		public var adoError:String = null;
		public var row:String = null;
		
		public function FindEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FindEvent = new FindEvent( type );
			e.adoError = adoError;
			e.row = row;
			return e;
		}
	}
}