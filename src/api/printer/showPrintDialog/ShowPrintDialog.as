package api.printer.showPrintDialog
{
	import api.events.printer.showPrintDialog.ShowPrintDialogEvent;

	import api.printer.Printer;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.printer.showPrintDialog.ShowPrintDialogEvent.RESULT
	*/
	[Event(name="result", type="api.events.printer.showPrintDialog.ShowPrintDialogEvent")]
	[Bindable]
	/**
	* Display the Windows print dialog to allow users to make changes to the selected printer and printer settings before starting a print operation.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_showPrintDialog.html Northcode Help Documentation
	*/
	public class ShowPrintDialog extends Printer
	{
		// Result
		/**
		* Indicates which button the user pressed to close the dialog. Valid return values are PRINT and CANCEL.
		*
		* @defaultValue <code>null</code>
		*/
		public var button:String = null;	
		
		/**
		* Constructor for Printer.ShowPrintDialog()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_showPrintDialog.html Northcode Help Documentation
		*/
		public function ShowPrintDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Display the Windows print dialog to allow users to make changes to the selected printer and printer settings before starting a print operation.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_showPrintDialog.html Northcode Help Documentation
		*/
		public function showPrintDialog():void
		{
			ssCore.Printer.showPrintDialog( {}
									  	   ,{callback:actionComplete, errorSTR:"showPrintDialogError", code:"32009"} );
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
			button = r.result;
			
			var e : ShowPrintDialogEvent = new ShowPrintDialogEvent( ShowPrintDialogEvent.RESULT );
			e.button = button;
			dispatchEvent( e );
		}
	}
}