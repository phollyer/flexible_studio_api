package api.events.activeX.setVisible
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class SetVisibleEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_OBJECT:String = "missingObject";
		
		public function SetVisibleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetVisibleEvent = new SetVisibleEvent( type );
			return e;
		}
	}
}