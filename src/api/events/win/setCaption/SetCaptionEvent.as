package api.events.win.setCaption
{
	import flash.events.Event;

	public class SetCaptionEvent extends Event
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_TEXT:String = "missingText";
		
		public function SetCaptionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetCaptionEvent = new SetCaptionEvent( type );
			return e;
		}
	}
}