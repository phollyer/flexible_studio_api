package api.events.transparent.setQuality
{
	import flash.events.Event;
	
	import api.events.transparent.TransparentEvent;

	public class SetQualityEvent extends TransparentEvent
	{
		
		public function SetQualityEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetQualityEvent = new SetQualityEvent( type );
			return e;
		}
	}
}