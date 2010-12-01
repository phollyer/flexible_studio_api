package api.events.transparent.freeze
{
	import flash.events.Event;
	
	import api.events.transparent.TransparentEvent;

	public class FreezeEvent extends TransparentEvent
	{
		
		public function FreezeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FreezeEvent = new FreezeEvent( type );
			return e;
		}
	}
}