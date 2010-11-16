package api.events.app.enableFlashTextFieldMenu
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class EnableFlashTextFieldMenuEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function EnableFlashTextFieldMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnableFlashTextFieldMenuEvent = new EnableFlashTextFieldMenuEvent( type );
			return e;
		}
	}
}