package api.events.wmVideo.setVolume
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetVolumeEvent extends WmVideoEvent
	{
		
		public function SetVolumeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetVolumeEvent = new SetVolumeEvent( type );
			return e;
		}
	}
}