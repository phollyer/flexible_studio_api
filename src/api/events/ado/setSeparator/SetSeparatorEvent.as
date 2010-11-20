package api.events.ado.setSeparator
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetSeparatorEvent extends AdoEvent
	{		
		public function SetSeparatorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetSeparatorEvent = new SetSeparatorEvent( type );
			return e;
		}
	}
}