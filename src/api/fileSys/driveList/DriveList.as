package api.fileSys.driveList
{
	import api.events.fileSys.driveList.DriveListEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

    [Event(name="complete", type="DriveListEvent")]
    [Event(name="result", type="DriveListEvent")]
    [Event(name="driveListError", type="FileSysError")]
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_driveList.html Northcode Help Documentation
	*/
	public class DriveList extends FileSys
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var drives:Array = null;
		
		/**
		* Constructor for FileSys.DriveList()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_driveList.html Northcode Help Documentation
		*/
		public function DriveList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_driveList.html Northcode Help Documentation
		*/
		public function driveList():void
		{
			ssCore.FileSys.driveList( {}
									 ,{callback:actionComplete, errorSTR:"driveListError", code:"9019"} );
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
			drives = r.result.split( COMMA );
			
			var e : DriveListEvent = new DriveListEvent( DriveListEvent.RESULT );
			e.drives = drives;
			dispatchEvent( e );
		}
	}
}