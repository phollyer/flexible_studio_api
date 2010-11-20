package api.events.wmVideo.resume
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class ResumeEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function ResumeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ResumeEvent = new ResumeEvent( type );
			return e;
		}
	}
}