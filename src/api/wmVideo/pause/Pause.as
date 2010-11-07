package api.wmVideo.pause
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class Pause extends WmVideo
	{
		public function Pause(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function pause():void
		{
			ssCore.WmVideo.pause( {}
								 ,{callback:actionComplete, errorSTR:"pauseError", code:"46002"} );
		}
	}
}