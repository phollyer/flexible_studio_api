package api.events.activeX.clearGuides
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class ClearGuidesEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_OBJECT:String = "missingObject";
		
		public function ClearGuidesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearGuidesEvent = new ClearGuidesEvent( type );
			return e;
		}
	}
}