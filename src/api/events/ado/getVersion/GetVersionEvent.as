package api.events.ado.getVersion
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class GetVersionEvent extends AdoEvent
	{		
		public var version:String = null;
		
		public function GetVersionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetVersionEvent = new GetVersionEvent( type );
			e.version = version;
			return e;
		}
	}
}