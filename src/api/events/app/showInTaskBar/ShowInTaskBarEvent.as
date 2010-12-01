package api.events.app.showInTaskBar
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowInTaskBarEvent extends AppEvent
	{		
		public function ShowInTaskBarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowInTaskBarEvent = new ShowInTaskBarEvent( type );
			return e;
		}
	}
}