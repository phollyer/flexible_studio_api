package api.events.transparent.isMaskedMode
{
	import flash.events.Event;
	
	import api.events.transparent.TransparentEvent;

	public class IsMaskedModeEvent extends TransparentEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var isMasked:Boolean = false;
		
		public function IsMaskedModeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IsMaskedModeEvent = new IsMaskedModeEvent( type );
			e.isMasked = isMasked;
			return e;
		}
	}
}