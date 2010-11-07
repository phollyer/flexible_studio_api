package api.app.cancelDialog
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;

	[Event(name="missingHWND" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class CancelDialog extends App
	{
		// Required
		public var hwnd:String = null;
		
		public function CancelDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
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