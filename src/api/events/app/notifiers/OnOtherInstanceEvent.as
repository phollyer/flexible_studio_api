package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnOtherInstanceEvent extends AppEvent
	{		
		public var commandLine:String = null;
		
		public function OnOtherInstanceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnOtherInstanceEvent = new OnOtherInstanceEvent( type );
			e.commandLine = commandLine;
			return e;
		}
	}
}