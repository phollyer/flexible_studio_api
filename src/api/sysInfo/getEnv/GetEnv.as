package api.sysInfo.getEnv
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getEnv.GetEnvEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="missingVariable" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.sysInfo.getEnv.GetEnvEvent")]
	[Bindable]
	public class GetEnv extends SysInfo
	{
		// Required
		public var variable:String = null;
		
		// Result
		public var value:String = null;
		
		public function GetEnv(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getEnv( envVariable:String = null ):void
		{
			variable = compareStrings( envVariable , variable );
			switch( variable )
			{
				case null:
					missingVariable();
					break;
				default:
					ssCore.SysInfo.getEnv( {}
										   		 ,{callback:actionComplete, errorSTR:"getEnvError", code:"38006"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			value = r.result;
			
			var e : GetEnvEvent = new GetEnvEvent( GetEnvEvent.RESULT );
			e.value = value;
			dispatchEvent( e );
		}
	}
}