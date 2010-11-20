package api.sysInfo.getUserName
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getUserName.GetUserNameEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getUserName.GetUserNameEvent")]
	[Bindable]
	public class GetUserName extends SysInfo
	{
		// Result
		public var userName:String = null;
		
		public function GetUserName(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getUserName():void
		{
			ssCore.SysInfo.getUserName( {}
									   ,{callback:actionComplete, errorSTR:"getUserNameError", code:"38014"} );
		}
		override protected function sendResult( r:Object ):void
		{
			userName = r.result;
			
			var e : GetUserNameEvent = new GetUserNameEvent( GetUserNameEvent.RESULT );
			e.userName = userName;
			dispatchEvent( e );
		}
	}
}