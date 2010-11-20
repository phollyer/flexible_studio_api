package api.events.plugin
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class PluginEvent extends KernelEvent
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