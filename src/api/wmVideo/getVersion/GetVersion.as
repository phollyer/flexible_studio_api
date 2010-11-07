package api.wmVideo.getVersion
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmVideo.getVersion.GetVersionEvent;
	import api.wmVideo.WmVideo;
	
	[Event(name="result", type="api.events.wmVideo.getVersion.GetVersionEvent")]
	[Bindable]
	public class GetVersion extends WmVideo
	{
		// Result
		public var version:Number = 0;
		
		public function GetVersion(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getVersion():void
		{
			ssCore.WmVideo.getVersion( {}
									  ,{callback:actionComplete, errorSTR:"getVersionError", code:"46001"} );
		}
		override protected function sendResult( r:Object ):void
		{
			version = Number( r.result );
			
			var e : GetVersionEvent = new GetVersionEvent( GetVersionEvent.RESULT );
			e.version = version;
			dispatchEvent( e );
		}
	}
}