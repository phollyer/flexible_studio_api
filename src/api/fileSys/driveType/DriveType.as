package api.fileSys.driveType
{
	import api.events.fileSys.driveType.DriveTypeEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

    [Event(name="complete", type="DriveTypeEvent")]
    [Event(name="missingDrive", type="DriveTypeEvent")]
    [Event(name="result", type="DriveTypeEvent")]
    [Event(name="driveTypeError", type="FileSysError")]
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_driveType.html Northcode Help Documentation
	*/
	public class DriveType extends FileSys
	{
		// Required
		/**
		* 
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
		public var typeOfDrive:String = null;
		
		/**
		* Constructor for FileSys.DriveType()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_driveType.html Northcode Help Documentation
		*/
		public function DriveType(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param driveSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_driveType.html Northcode Help Documentation
		*/
		public function driveType( driveSTR:String = null ):void
		{
			drive = compareStrings( driveSTR , drive );
			
			switch( drive )
			{
				case null:
					missingDrive();
					break;
				default:
					ssCore.FileSys.driveType( {drive:drive}
											 ,{callback:actionComplete, errorSTR:"driveTypeError", code:"9020"} );
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
			typeOfDrive = r.result;
			
			var e : DriveTypeEvent = new DriveTypeEvent( DriveTypeEvent.RESULT );
			e.typeOfDrive = typeOfDrive;
			dispatchEvent( e );
		}
	}
}