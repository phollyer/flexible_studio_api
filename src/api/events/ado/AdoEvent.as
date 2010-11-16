package api.events.ado
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class AdoEvent extends SWFStudioEvent
	{
		public function AdoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AdoEvent = new AdoEvent( type );
			return e;
		}
	}
}