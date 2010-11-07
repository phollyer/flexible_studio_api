package api.events.app.showInTaskList
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowInTaskListEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function ShowInTaskListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowInTaskListEvent = new ShowInTaskListEvent( type );
			return e;
		}
	}
}