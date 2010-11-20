package api.events.activeX.setProperty
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class SetPropertyEvent extends ActiveXEvent
	{		
		public function SetPropertyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPropertyEvent = new SetPropertyEvent( type );
			return e;
		}
	}
}