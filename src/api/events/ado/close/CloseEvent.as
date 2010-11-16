package api.events.ado.close
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class CloseEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function CloseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CloseEvent = new CloseEvent( type );
			return e;
		}
	}
}