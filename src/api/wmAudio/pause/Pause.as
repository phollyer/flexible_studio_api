package api.wmAudio.pause
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Bindable]
	public class Pause extends WmAudio
	{
		public function Pause(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function pause():void
		{
			ssCore.WmAudio.pause( {}
								 ,{callback:actionComplete, errorSTR:"pauseError", code:"45001"} );
		}
	}
}