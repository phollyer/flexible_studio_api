package api.wmAudio.stop
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Bindable]
	public class Stop extends WmAudio
	{
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function stop():void
		{
			ssCore.WmAudio.stop( {}
								,{callback:actionComplete, errorSTR:"stopError", code:"46011"} );
		}
	}
}