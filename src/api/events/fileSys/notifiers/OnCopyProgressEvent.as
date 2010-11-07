package api.events.fileSys.notifiers
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class OnCopyProgressEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var bytesCopied:Number = -1;
		
		public function OnCopyProgressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnCopyProgressEvent = new OnCopyProgressEvent( type );
			e.bytesCopied = bytesCopied;
			return e;
		}
	}
}