package api.events.mask.loadBitmap
{
	import flash.events.Event;
	
	import api.events.mask.MaskEvent;

	public class LoadBitmapEvent extends MaskEvent
	{
		
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