package api.events.ado.setRowFormat
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetRowFormatEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetRowFormatEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetRowFormatEvent = new SetRowFormatEvent( type );
			return e;
		}
	}
}