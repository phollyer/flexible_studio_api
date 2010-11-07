package api.sysInfo.isUserAnAdmin
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.isUserAnAdmin.IsUserAnAdminEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.isUserAnAdmin.IsUserAnAdminEvent")]
	[Bindable]
	public class IsUserAnAdmin extends SysInfo
	{
		// Result
		public var isAdmin:Boolean = false;
		
		public function IsUserAnAdmin(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function isUserAnAdmin():void
		{
			ssCore.SysInfo.isUserAnAdmin( {}
									   	 ,{callback:actionComplete, errorSTR:"isUserAnAdminError", code:"38017"} );
		}
		override protected function sendResult( r:Object ):void
		{
			isAdmin = checkBoolean( r.result );
			
			var e : IsUserAnAdminEvent = new IsUserAnAdminEvent( IsUserAnAdminEvent.RESULT );
			e.isAdmin = isAdmin;
			dispatchEvent( e );
		}
	}
}