package api.events.ado.setDelimiter
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetDelimiterEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetDelimiterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetDelimiterEvent = new SetDelimiterEvent( type );
			return e;
		}
	}
}