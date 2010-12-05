package api.printer.showPageSetupDialog
{
	import api.events.printer.showPageSetupDialog.ShowPageSetupDialogEvent;

	import api.printer.Printer;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.printer.showPageSetupDialog.ShowPageSetupDialogEvent.RESULT
	*/
	[Event(name="result", type="api.events.printer.showPageSetupDialog.ShowPageSetupDialogEvent")]
	[Bindable]
	/**
	* Display the Windows page setup dialog to allow the page settings (margins, paper bin, paper orientation) to be changed for the defaut printer.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_showPageSetupDialog.html Northcode Help Documentation
	*/
	public class ShowPageSetupDialog extends Printer
	{
		// Result
		/**
		* Indicates which button the user pressed to close the dialog. Valid return values are OK and CANCEL.
		*
		* @defaultValue <code>null</code>
		*/
		public var button:String = null;	
		
		/**
		* Constructor for Printer.ShowPageSetupDialog()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_showPageSetupDialog.html Northcode Help Documentation
		*/
		public function ShowPageSetupDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Display the Windows page setup dialog to allow the page settings (margins, paper bin, paper orientation) to be changed for the defaut printer.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_showPageSetupDialog.html Northcode Help Documentation
		*/
		public function showPageSetupDialog():void
		{
			ssCore.Printer.showPageSetupDialog( {}
									  	       ,{callback:actionComplete, errorSTR:"showPageSetupDialogError", code:"32008"} );
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
			
			var e : ShowPageSetupDialogEvent = new ShowPageSetupDialogEvent( ShowPageSetupDialogEvent.RESULT );
			e.button = button;
			dispatchEvent( e );
		}
	}
}