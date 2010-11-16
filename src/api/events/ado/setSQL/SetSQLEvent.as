package api.events.ado.setSQL
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetSQLEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetSQLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetSQLEvent = new SetSQLEvent( type );
			return e;
		}
	}
}