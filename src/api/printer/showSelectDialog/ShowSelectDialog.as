package api.printer.showSelectDialog
{
	import api.events.printer.showSelectDialog.ShowSelectDialogEvent;

	import api.printer.Printer;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.printer.showSelectDialog.ShowSelectDialogEvent.RESULT
	*/
	[Event(name="result", type="api.events.printer.showSelectDialog.ShowSelectDialogEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_showSelectDialog.html Northcode Help Documentation
	*/
	public class ShowSelectDialog extends Printer
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var button:String = null;	
		
		/**
		* Constructor for Printer.ShowSelectDialog()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_showSelectDialog.html Northcode Help Documentation
		*/
		public function ShowSelectDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_showSelectDialog.html Northcode Help Documentation
		*/
		public function showSelectDialog():void
		{
			ssCore.Printer.showSelectDialog( {}
									  	       ,{callback:actionComplete, errorSTR:"showSelectDialogError", code:"32010"} );
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
			
			var e : ShowSelectDialogEvent = new ShowSelectDialogEvent( ShowSelectDialogEvent.RESULT );
			e.button = button;
			dispatchEvent( e );
		}
	}
}