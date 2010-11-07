package api.wmAudio.setMute
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Bindable]
	public class SetMute extends WmAudio
	{
		// Optional 
		public var flag:Boolean = true;
		
		public function SetMute(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setMute():void
		{
			ssCore.WmAudio.setMute( {flag:flag}
								   ,{callback:actionComplete, errorSTR:"setMuteError", code:"46005"} );
		}
	}
}