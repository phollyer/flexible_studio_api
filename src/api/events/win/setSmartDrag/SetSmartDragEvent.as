package api.events.win.setSmartDrag
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetSmartDragEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetSmartDragEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetSmartDragEvent = new SetSmartDragEvent( type );
			return e;
		}
	}
}