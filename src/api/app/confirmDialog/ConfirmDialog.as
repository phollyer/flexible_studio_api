package api.app.confirmDialog
{
	import api.app.App;

	import flash.events.IEventDispatcher;

        [Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_confirmDialog.html Northcode Help Documentation
	 */
	public class ConfirmDialog extends App
	{
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var hwnd:String = null;
		
		/**
		 * Constructor for App.ConfirmDialog()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_confirmDialog.html Northcode Help Documentation
		 */
		public function ConfirmDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param dialogHWND
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_confirmDialog.html Northcode Help Documentation
		 */
		public function confirmDialog( dialogHWND:String = null ):void
		{
			hwnd = compareStrings( dialogHWND , hwnd );
			switch( hwnd )
			{
				case null:
					missingHWND();
					break;
				default:
					ssCore.App.confirmDialog( {hwnd:hwnd} , {callback:actionComplete, errorSTR:"confirmDialogError", code:"8007"} );
			}
		}
	}
}