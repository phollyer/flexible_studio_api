package api.wmVideo.setVersion
{
	import flash.events.IEventDispatcher;
	import api.wmVideo.WmVideo;
	
	[Bindable]
	public class SetVersion extends WmVideo
	{
		// Optional 
		public var version:Number = 9;
		
		public function SetVersion(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setVersion():void
		{
			ssCore.WmVideo.setVersion( {version:version}
									  ,{callback:actionComplete, errorSTR:"setVersionError", code:"46015"} );
		}
	}
}