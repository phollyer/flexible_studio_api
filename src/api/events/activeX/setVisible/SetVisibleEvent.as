package api.events.activeX.setVisible
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class SetVisibleEvent extends ActiveXEvent
	{		
		public function SetVisibleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetVisibleEvent = new SetVisibleEvent( type );
			return e;
		}
	}
}