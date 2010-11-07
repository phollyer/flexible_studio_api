package api.sysInfo.getDriveLabel
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getDriveLabel.GetDriveLabelEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="missingDriveLetter" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.sysInfo.getDriveLabel.GetDriveLabelEvent")]
	[Bindable]
	public class GetDriveLabel extends SysInfo
	{
		// Required
		public var drive:String = null;
		
		// Result
		public var driveLabel:String = null;
		
		public function GetDriveLabel(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getDriveLabel( driveLetter:String = null ):void
		{
			drive = compareStrings( driveLetter , drive );
			switch( drive )
			{
				case null:
					missingDriveLetter();
					break;
				default:
					ssCore.SysInfo.getDriveLabel( {}
										   		 ,{callback:actionComplete, errorSTR:"getDriveLabelError", code:"38005"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			driveLabel = r.result;
			
			var e : GetDriveLabelEvent = new GetDriveLabelEvent( GetDriveLabelEvent.RESULT );
			e.driveLabel = driveLabel;
			dispatchEvent( e );
		}
	}
}