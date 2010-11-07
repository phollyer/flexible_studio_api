package api.events.app.updateTransparency
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class UpdateTransparencyEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function UpdateTransparencyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : UpdateTransparencyEvent = new UpdateTransparencyEvent( type );
			return e;
		}
	}
}