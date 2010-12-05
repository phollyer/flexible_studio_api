package api.sysInfo.getDriveLabel
{
	import api.events.sysInfo.getDriveLabel.GetDriveLabelEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>driveLetter</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DRIVELETTER
	*/
	[Event(name="missingDriveLetter" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getDriveLabel.GetDriveLabelEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getDriveLabel.GetDriveLabelEvent")]
	[Bindable]
	/**
	* Get the label of the specified drive.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getDriveLabel.html Northcode Help Documentation
	*/
	public class GetDriveLabel extends SysInfo
	{
		// Required
		/**
		* The drive letter ('A:' to 'Z:') to be described. The colon (':') following the drive letter is optional.
		*
		* @defaultValue <code>null</code>
		*/
		public var drive:String = null;
		
		// Result
		/**
		* The drive letter ('A:' to 'Z:') to be described. The colon (':') following the drive letter is optional.
		*
		* @defaultValue <code>null</code>
		*/
		public var driveLabel:String = null;
		
		/**
		* Constructor for SysInfo.GetDriveLabel()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getDriveLabel.html Northcode Help Documentation
		*/
		public function GetDriveLabel(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Get the label of the specified drive.
		*
		*
		* @param driveLetter
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getDriveLabel.html Northcode Help Documentation
		*/
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			driveLabel = r.result;
			
			var e : GetDriveLabelEvent = new GetDriveLabelEvent( GetDriveLabelEvent.RESULT );
			e.driveLabel = driveLabel;
			dispatchEvent( e );
		}
	}
}