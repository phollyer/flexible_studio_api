package api.events.transparent.forceMaskedMode
{
	import flash.events.Event;
	
	import api.events.transparent.TransparentEvent;

	public class ForceMaskedModeEvent extends TransparentEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function ForceMaskedModeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ForceMaskedModeEvent = new ForceMaskedModeEvent( type );
			return e;
		}
	}
}