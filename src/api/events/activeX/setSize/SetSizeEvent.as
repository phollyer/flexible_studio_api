package api.events.activeX.setSize
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class SetSizeEvent extends ActiveXEvent
	{		
		public function SetSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetSizeEvent = new SetSizeEvent( type );
			return e;
		}
	}
}