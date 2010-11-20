package api.events.app.showMessageBox
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowMessageBoxEvent extends AppEvent
	{		
		public var selectedButton:String = null;
		
		public function ShowMessageBoxEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowMessageBoxEvent = new ShowMessageBoxEvent( type );
			e.selectedButton = selectedButton;
			return e;
		}
	}
}