package api.printer.showPrintDialog
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.printer.showPrintDialog.ShowPrintDialogEvent;
	import api.printer.Printer;
	
	[Event(name="result", type="api.events.printer.showPrintDialog.ShowPrintDialogEvent")]
	[Bindable]
	public class ShowPrintDialog extends Printer
	{
		// Result
		public var button:String = null;	
		
		public function ShowPrintDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showPrintDialog():void
		{
			ssCore.Printer.showPrintDialog( {}
									  	   ,{callback:actionComplete, errorSTR:"showPrintDialogError", code:"32009"} );
		}
		override protected function sendResult( r:Object ):void
		{
			button = r.result;
			
			var e : ShowPrintDialogEvent = new ShowPrintDialogEvent( ShowPrintDialogEvent.RESULT );
			e.button = button;
			dispatchEvent( e );
		}
	}
}