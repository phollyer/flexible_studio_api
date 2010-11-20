package api.printer.showSelectDialog
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.printer.showSelectDialog.ShowSelectDialogEvent;
	import api.printer.Printer;
	
	[Event(name="result", type="api.events.printer.showSelectDialog.ShowSelectDialogEvent")]
	[Bindable]
	public class ShowSelectDialog extends Printer
	{
		// Result
		public var button:String = null;	
		
		public function ShowSelectDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showSelectDialog():void
		{
			ssCore.Printer.showSelectDialog( {}
									  	       ,{callback:actionComplete, errorSTR:"showSelectDialogError", code:"32010"} );
		}
		override protected function sendResult( r:Object ):void
		{
			button = r.result;
			
			var e : ShowSelectDialogEvent = new ShowSelectDialogEvent( ShowSelectDialogEvent.RESULT );
			e.button = button;
			dispatchEvent( e );
		}
	}
}