package api.sysInfo.getComputerName
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getComputerName.GetComputerNameEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getComputerName.GetComputerNameEvent")]
	[Bindable]
	public class GetComputerName extends SysInfo
	{
		// Result
		public var computerName:String = null;
		
		public function GetComputerName(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getComputerName():void
		{
			ssCore.SysInfo.getComputerName( {}
										   ,{callback:actionComplete, errorSTR:"getComputerNameError", code:"38001"} );
		}
		override protected function sendResult( r:Object ):void
		{
			computerName = r.result;
			
			var e : GetComputerNameEvent = new GetComputerNameEvent( GetComputerNameEvent.RESULT );
			e.computerName = computerName;
			dispatchEvent( e );
		}
	}
}