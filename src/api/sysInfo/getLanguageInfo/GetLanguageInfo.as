package api.sysInfo.getLanguageInfo
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getLanguageInfo.GetLanguageInfoEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getLanguageInfo.GetLanguageInfoEvent")]
	[Bindable]
	public class GetLanguageInfo extends SysInfo
	{
		// Result
		public var primaryLanguage:String = null;
		public var subLanguage:String = null;
		
		public function GetLanguageInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getLanguageInfo():void
		{
			ssCore.SysInfo.getLanguageInfo( {}
										   ,{callback:actionComplete, errorSTR:"getLanguageInfoError", code:"38008"} );
		}
		override protected function sendResult( r:Object ):void
		{
			primaryLanguage = r.result.split( COMMA )[ 0 ];
			subLanguage = r.result.split( COMMA )[ 1 ];
			
			var e : GetLanguageInfoEvent = new GetLanguageInfoEvent( GetLanguageInfoEvent.RESULT );
			e.primaryLanguage = primaryLanguage;
			e.subLanguage = subLanguage;
			dispatchEvent( e );
		}
	}
}