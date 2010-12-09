package api.win.restore
{
	import api.events.win.restore.RestoreEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Restore the application window to its size and position before it was minimized or maximized.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_restore.html Northcode Help Documentation
	*/
	public class Restore extends Win
	{
		/**
		* Constructor for Win.Restore()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_restore.html Northcode Help Documentation
		*/
		public function Restore(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Restore the application window to its size and position before it was minimized or maximized.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_restore.html Northcode Help Documentation
		*/
		public function restore():void
		{
			ssCore.Win.restore( {}
							   ,{callback:actionComplete, errorSTR:"restoreError", code:"6014"} );
		}
	}
}