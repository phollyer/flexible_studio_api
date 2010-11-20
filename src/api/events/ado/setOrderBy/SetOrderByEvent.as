package api.events.ado.setOrderBy
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetOrderByEvent extends AdoEvent
	{		
		public function SetOrderByEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetOrderByEvent = new SetOrderByEvent( type );
			return e;
		}
	}
}