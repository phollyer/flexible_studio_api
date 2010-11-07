package api.printer.showPageSetupDialog
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.printer.showPageSetupDialog.ShowPageSetupDialogEvent;
	import api.printer.Printer;
	
	[Event(name="result", type="api.events.printer.showPageSetupDialog.ShowPageSetupDialogEvent")]
	[Bindable]
	public class ShowPageSetupDialog extends Printer
	{
		// Result
		public var button:String = null;	
		
		public function ShowPageSetupDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showPageSetupDialog():void
		{
			ssCore.Printer.showPageSetupDialog( {}
									  	       ,{callback:actionComplete, errorSTR:"showPageSetupDialogError", code:"32008"} );
		}
		override protected function sendResult( r:Object ):void
		{
			button = r.result;
			
			var e : ShowPageSetupDialogEvent = new ShowPageSetupDialogEvent( ShowPageSetupDialogEvent.RESULT );
			e.button = button;
			dispatchEvent( e );
		}
	}
}