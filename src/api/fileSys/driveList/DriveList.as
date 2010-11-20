package api.fileSys.driveList
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.driveList.DriveListEvent;
	import api.fileSys.FileSys;

    [Event(name="complete", type="DriveListEvent")]
    [Event(name="result", type="DriveListEvent")]
    [Event(name="driveListError", type="FileSysError")]
    [Bindable]
	public class DriveList extends FileSys
	{
		// Result
		public var drives:Array = null;
		
		public function DriveList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function driveList():void
		{
			ssCore.FileSys.driveList( {}
									 ,{callback:actionComplete, errorSTR:"driveListError", code:"9019"} );
		}
		override protected function sendResult( r:Object ):void
		{
			drives = r.result.split( COMMA );
			
			var e : DriveListEvent = new DriveListEvent( DriveListEvent.RESULT );
			e.drives = drives;
			dispatchEvent( e );
		}
	}
}