package api.events.mask.enable
{
	import flash.events.Event;
	
	import api.events.mask.MaskEvent;

	public class EnableEvent extends MaskEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_MASK_NAME:String = "missingMaskName";
		
		public function EnableEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnableEvent = new EnableEvent( type );
			return e;
		}
	}
}