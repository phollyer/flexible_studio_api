package api.events.ado.setTable
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetTableEvent extends AdoEvent
	{		
		public function SetTableEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetTableEvent = new SetTableEvent( type );
			return e;
		}
	}
}