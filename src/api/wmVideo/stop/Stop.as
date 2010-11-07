package api.wmVideo.stop
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class Stop extends WmVideo
	{
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function stop():void
		{
			ssCore.WmVideo.stop( {}
								,{callback:actionComplete, errorSTR:"stopError", code:"46018"} );
		}
	}
}