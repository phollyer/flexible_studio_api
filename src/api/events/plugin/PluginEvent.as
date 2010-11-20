package api.events.plugin
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class PluginEvent extends SWFStudioEvent
	{
		public function PluginEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PluginEvent = new PluginEvent( type );
			return e;
		}
	}
}