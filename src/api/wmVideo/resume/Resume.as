package api.wmVideo.resume
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class Resume extends WmVideo
	{
		public function Resume(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function resume():void
		{
			ssCore.WmVideo.resume( {}
								  ,{callback:actionComplete, errorSTR:"resumeError", code:"46004"} );
		}
	}
}