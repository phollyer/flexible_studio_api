package api.events.plugin.unload
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class UnloadEvent extends PluginEvent
	{
		
		public function UnloadEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : UnloadEvent = new UnloadEvent( type );
			return e;
		}
	}
}