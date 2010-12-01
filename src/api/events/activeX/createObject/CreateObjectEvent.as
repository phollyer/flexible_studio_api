package api.events.activeX.createObject
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class CreateObjectEvent extends ActiveXEvent
	{		
		public function CreateObjectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CreateObjectEvent = new CreateObjectEvent( type );
			return e;
		}
	}
}