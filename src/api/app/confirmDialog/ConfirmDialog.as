package api.app.confirmDialog
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;

        [Bindable]
	public class ConfirmDialog extends App
	{
		// Required
		public var hwnd:String = null;
		
		public function ConfirmDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
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