package api.events.mask.loadBitmap
{
	import flash.events.Event;
	
	import api.events.mask.MaskEvent;

	public class LoadBitmapEvent extends MaskEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_MASK_COLOR:String = "missingMaskColor";
		public static const MISSING_MASK_NAME:String = "missingMaskName";
		public static const MISSING_PATH:String = "missingPath";
		
		public function LoadBitmapEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event{
			var e : LoadBitmapEvent = new LoadBitmapEvent( type );
			return e;
		}
	}
}