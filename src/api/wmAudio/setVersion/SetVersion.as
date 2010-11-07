package api.wmAudio.setVersion
{
	import flash.events.IEventDispatcher;
	import api.wmAudio.WmAudio;
	
	[Bindable]
	public class SetVersion extends WmAudio
	{
		// Optional 
		public var version:Number = 9;
		
		public function SetVersion(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setVersion():void
		{
			ssCore.WmAudio.setVersion( {version:version}
									  ,{callback:actionComplete, errorSTR:"setVersionError", code:"46009"} );
		}
	}
}