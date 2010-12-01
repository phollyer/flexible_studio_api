package api.events.activeX.clearGuides
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class ClearGuidesEvent extends ActiveXEvent
	{		
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