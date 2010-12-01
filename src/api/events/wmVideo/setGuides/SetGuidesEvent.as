package api.events.wmVideo.setGuides
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetGuidesEvent extends WmVideoEvent
	{
		
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