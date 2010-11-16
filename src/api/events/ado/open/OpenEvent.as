package api.events.ado.open
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class OpenEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var adoError:String = null;
		
		public function OpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OpenEvent = new OpenEvent( type );
			e.adoError = adoError;
			return e;
		}
	}
}