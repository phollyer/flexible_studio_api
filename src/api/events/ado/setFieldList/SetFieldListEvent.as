package api.events.ado.setFieldList
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetFieldListEvent extends AdoEvent
	{		
		public function SetFieldListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetFieldListEvent = new SetFieldListEvent( type );
			return e;
		}
	}
}