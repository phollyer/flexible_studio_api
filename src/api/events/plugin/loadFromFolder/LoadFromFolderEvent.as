package api.events.plugin.loadFromFolder
{
	import flash.events.Event;
	
	import api.events.plugin.PluginEvent;

	public class LoadFromFolderEvent extends PluginEvent
	{
		
		public function LoadFromFolderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LoadFromFolderEvent = new LoadFromFolderEvent( type );
			return e;
		}
	}
}