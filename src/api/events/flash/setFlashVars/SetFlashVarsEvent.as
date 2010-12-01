package api.events.flash.setFlashVars
{
	import flash.events.Event;
	
	import api.events.flash.FlashEvent;

	public class SetFlashVarsEvent extends FlashEvent
	{
		
		public function SetFlashVarsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetFlashVarsEvent = new SetFlashVarsEvent( type );
			return e;
		}
	}
}