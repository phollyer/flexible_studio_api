package api.app.cancelDialog
{
	import api.app.App;

	import api.events.app.cancelDialog.CancelDialogEvent;

	import flash.events.IEventDispatcher;

	/**
	 * Dispatched if the Property <code>hWND</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_HWND
	 */
	[Event(name="missingHWND" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 * Cancels the specified dialog by sending it a CANCEL message, which in most cases is the same as pressing the cancel button. You should only call this command from an onDialog event handler (see App.setNotify).
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_cancelDialog.html Northcode Help Documentation
	 */
	public class CancelDialog extends App
	{
		// Required
		/**
		 * Window handle of the dialog to be cancelled.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var hwnd:String = null;
		
		/**
		 * Constructor for App.CancelDialog()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_cancelDialog.html Northcode Help Documentation
		 */
		public function CancelDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Cancels the specified dialog by sending it a CANCEL message, which in most cases is the same as pressing the cancel button. You should only call this command from an onDialog event handler (see App.setNotify).
		 *
                 *
		 * @param dialogHWND
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_cancelDialog.html Northcode Help Documentation
		 */
		public function cancelDialog( dialogHWND:String = null ):void
		{
			hwnd = compareStrings( dialogHWND , hwnd );
			switch( hwnd )
			{
				case null:
					missingHWND();
					break;
				default:
					ssCore.App.cancelDialog( {hwnd:hwnd} , {callback:actionComplete, errorSTR:"cancelDialogError", code:"8006"} );
			}
		}
	}
}