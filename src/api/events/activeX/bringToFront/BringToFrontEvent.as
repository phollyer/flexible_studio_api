package api.events.activeX.bringToFront
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class BringToFrontEvent extends ActiveXEvent
	{		
		public function BringToFrontEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : BringToFrontEvent = new BringToFrontEvent( type );
			return e;
		}
	}
}