package api.wmAudio.play
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Bindable]
	public class Play extends WmAudio
	{
		public function Play(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function play():void
		{
			ssCore.WmAudio.play( {}
								,{callback:actionComplete, errorSTR:"playError", code:"46002"} );
		}
	}
}