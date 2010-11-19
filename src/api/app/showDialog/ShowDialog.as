package api.app.showDialog
{
	import api.app.App;

	import api.events.app.showDialog.ShowDialogEvent;

	import flash.events.IEventDispatcher;
	import api.events.app.showDialog.ShowDialogEvent

	/**
	 * Dispatched if the Property <code>hWND</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_HWND
	 */
	[Event(name="missingHWND" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showDialog.html Northcode Help Documentation
	 */
	public class ShowDialog extends App
	{
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var hwnd:String = null;
		
		/**
		 * Constructor for App.ShowDialog()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showDialog.html Northcode Help Documentation
		 */
		public function ShowDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param dialogHWND
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showDialog.html Northcode Help Documentation
		 */
		public function showDialog( dialogHWND:String ):void
		{
			hwnd = compareStrings( dialogHWND , hwnd );
			switch( hwnd )
			{
				case null:
					missingHWND();
					break;
				default:
					ssCore.App.showDialog( {hwnd:hwnd} , {callback:actionComplete, errorSTR:"showDialogError", code:"8018"} );
			}
		}
	}
}