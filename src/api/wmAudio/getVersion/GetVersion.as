package api.wmAudio.getVersion
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmAudio.getVersion.GetVersionEvent;
	import api.wmAudio.WmAudio;
	
	[Event(name="result", type="api.events.wmAudio.getVersion.GetVersionEvent")]
	[Bindable]
	public class GetVersion extends WmAudio
	{
		// Result
		public var version:Number = 0;
		
		public function GetVersion(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getVersion():void
		{
			ssCore.WmAudio.getVersion( {}
									  ,{callback:actionComplete, errorSTR:"getVersionError", code:"45000"} );
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