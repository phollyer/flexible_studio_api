package api.wmVideo.play
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class Play extends WmVideo
	{
		public function Play(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function play():void
		{
			ssCore.WmVideo.play( {}
								,{callback:actionComplete, errorSTR:"playError", code:"46003"} );
		}
	}
}