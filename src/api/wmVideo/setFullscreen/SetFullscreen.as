package api.wmVideo.setFullscreen
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetFullscreen extends WmVideo
	{
		// Optional 
		public var flag:Boolean = true;
		
		public function SetFullscreen(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setFullscreen():void
		{
			ssCore.WmVideo.setFullscreen( {flag:flag}
										 ,{callback:actionComplete, errorSTR:"setFullscreenError", code:"46006"} );
		}
	}
}