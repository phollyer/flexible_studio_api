package api.events.activeX.setGuides
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class SetGuidesEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_OBJECT:String = "missingObject";
		
		public function SetGuidesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetGuidesEvent = new SetGuidesEvent( type );
			return e;
		}
	}
}