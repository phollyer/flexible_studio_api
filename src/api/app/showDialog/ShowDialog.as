package api.app.showDialog
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;

	[Event(name="missingHWND" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ShowDialog extends App
	{
		// Required
		public var hwnd:String = null;
		
		public function ShowDialog(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showDialog( dialogHWND:String ):void
		{
			hwnd = compareStrings( dialogHWND , hwnd );
			switch( hwnd )
			{
				case null:
					hwndMissing();
					break;
				default:
					ssCore.App.showDialog( {hwnd:hwnd} , {callback:actionComplete, errorSTR:"showDialogError", code:"8018"} );
			}
		}
		private function hwndMissing():void
		{
			var e : ShowDialogEvent = new ShowDialogEvent( ShowDialogEvent.RESULT_HWND );
			dispatchEvent( e );
		}
	}
}