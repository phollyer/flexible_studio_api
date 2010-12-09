package api.fileSys.serialNumber
{
	import api.events.fileSys.serialNumber.SerialNumberEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>drive</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DRIVE
	*/
	[Event(name="missingDrive" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.fileSys.serialNumber.SerialNumberEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.serialNumber.SerialNumberEvent")]
	[Bindable]
	/**
	* Returns the serial number of any local drive.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_serialNumber.html Northcode Help Documentation
	*/
	public class SerialNumber extends FileSys
	{
		// Required
		/**
		* Drive to be identified.
		*
		* @defaultValue <code>null</code>
		*/
		public var drive:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var number:String = null;
		
		/**
		* Constructor for FileSys.SerialNumber()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_serialNumber.html Northcode Help Documentation
		*/
		public function SerialNumber(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Returns the serial number of any local drive.
		*
		*
		* @param driveSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_serialNumber.html Northcode Help Documentation
		*/
		public function serialNumber( driveSTR:String = null ):void
		{
			drive = compareStrings( driveSTR , drive );
			
			switch( drive )
			{
				case null:
					missingDrive();
					break;
				default:
					ssCore.FileSys.serialNumber( {drive:drive}
												,{callback:actionComplete, errorSTR:"serialNumberError", code:"9033"} );
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
			number = r.result;
			
			var e : SerialNumberEvent = new SerialNumberEvent( SerialNumberEvent.RESULT );
			e.number = number;
			dispatchEvent( e );
		}
	}
}