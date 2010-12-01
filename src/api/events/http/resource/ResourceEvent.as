package api.events.http.resource
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class ResourceEvent extends HttpEvent
	{
		
		public function ResourceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ResourceEvent = new ResourceEvent( type );
			return e;
		}
	}
}