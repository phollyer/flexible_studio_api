package api.events.activeX.getProperty
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class GetPropertyEvent extends ActiveXEvent
	{		
		public var propertyVal:Object = null;
		
		public function GetPropertyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetPropertyEvent = new GetPropertyEvent( type );
			e.propertyVal = propertyVal;
			return e;
		}
	}
}