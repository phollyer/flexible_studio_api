package api.events.plugin.load
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class LoadEvent extends PluginEvent
	{
		
		public function LoadEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LoadEvent = new LoadEvent( type );
			return e;
		}
	}
}