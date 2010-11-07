package api.wmVideo.setVolume
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetVolume extends WmVideo
	{
		// Optional 
		public var volume:Number = -5000;
		
		public function SetVolume(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setVolume():void
		{
			ssCore.WmVideo.setVolume( {volume:volume}
									 ,{callback:actionComplete, errorSTR:"setVolumeError", code:"46016"} );
		}
	}
}