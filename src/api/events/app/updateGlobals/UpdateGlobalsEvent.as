package api.events.app.updateGlobals
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class UpdateGlobalsEvent extends AppEvent
	{		
		public function UpdateGlobalsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : UpdateGlobalsEvent = new UpdateGlobalsEvent( type );
			return e;
		}
	}
}