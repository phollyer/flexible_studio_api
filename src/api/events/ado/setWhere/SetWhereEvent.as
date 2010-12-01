package api.events.ado.setWhere
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetWhereEvent extends AdoEvent
	{		
		public function SetWhereEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetWhereEvent = new SetWhereEvent( type );
			return e;
		}
	}
}