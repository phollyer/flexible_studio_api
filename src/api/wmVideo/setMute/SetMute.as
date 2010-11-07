package api.wmVideo.setMute
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetMute extends WmVideo
	{
		// Optional 
		public var flag:Boolean = true;
		
		public function SetMute(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setMute():void
		{
			ssCore.WmVideo.setMute( {flag:flag}
								   ,{callback:actionComplete, errorSTR:"setMuteError", code:"46009"} );
		}
	}
}