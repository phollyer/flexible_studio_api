package api.wmAudio.setVolume
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Bindable]
	public class SetVolume extends WmAudio
	{
		// Optional 
		public var volume:Number = -5000;
		
		public function SetVolume(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setVolume():void
		{
			ssCore.WmAudio.setVolume( {volume:volume}
									 ,{callback:actionComplete, errorSTR:"setVolumeError", code:"46010"} );
		}
	}
}