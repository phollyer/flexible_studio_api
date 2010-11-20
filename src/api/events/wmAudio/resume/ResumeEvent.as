package api.events.wmAudio.resume
{
	import flash.events.Event;
	
	import api.events.wmAudio.WmAudioEvent;

	public class ResumeEvent extends WmAudioEvent
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