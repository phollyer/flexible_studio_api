package api.fileSys.driveType
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.driveType.DriveTypeEvent;
	import api.fileSys.FileSys;

    [Event(name="complete", type="DriveTypeEvent")]
    [Event(name="missingDrive", type="DriveTypeEvent")]
    [Event(name="result", type="DriveTypeEvent")]
    [Event(name="driveTypeError", type="FileSysError")]
    [Bindable]
	public class DriveType extends FileSys
	{
		// Required
		public var drive:String = null;
		
		// Result
		public var typeOfDrive:String = null;
		
		public function DriveType(target:IEventDispatcher=null)
		{
			super(target);
		}
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
		override protected function sendResult( r:Object ):void
		{
			typeOfDrive = r.result;
			
			var e : DriveTypeEvent = new DriveTypeEvent( DriveTypeEvent.RESULT );
			e.typeOfDrive = typeOfDrive;
			dispatchEvent( e );
		}
	}
}