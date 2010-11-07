package api.events.flash.setFlashVars
{
	import flash.events.Event;
	
	import api.events.flash.FlashEvent;

	public class SetFlashVarsEvent extends FlashEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_FLASH_VARS:String = "missingFlashVars";
		
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