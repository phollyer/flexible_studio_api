package api.events.ado.refresh
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class RefreshEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function RefreshEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RefreshEvent = new RefreshEvent( type );
			return e;
		}
	}
}