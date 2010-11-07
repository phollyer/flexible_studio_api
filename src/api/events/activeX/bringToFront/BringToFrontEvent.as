package api.events.activeX.bringTofront
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class BringToFrontEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_OBJECT:String = "missingObject";
		
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