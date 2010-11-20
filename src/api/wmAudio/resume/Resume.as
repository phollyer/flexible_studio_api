package api.wmAudio.resume
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Bindable]
	public class Resume extends WmAudio
	{
		public function Resume(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function resume():void
		{
			ssCore.WmAudio.resume( {}
								  ,{callback:actionComplete, errorSTR:"resumeError", code:"46003"} );
		}
	}
}