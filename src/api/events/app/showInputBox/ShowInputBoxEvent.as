package api.events.app.showInputBox
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowInputBoxEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PROMPT:String = "missingPrompt";
		public static const RESULT:String = "result";
		
		public var text:String = null;
		
		public function ShowInputBoxEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowInputBoxEvent = new ShowInputBoxEvent( type );
			e.text = text;
			return e;
		}
	}
}