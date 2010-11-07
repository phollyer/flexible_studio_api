package api.events.activeX.setPosition
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class SetPositionEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_OBJECT:String = "missingObject";
		
		public function SetPositionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPositionEvent = new SetPositionEvent( type );
			return e;
		}
	}
}