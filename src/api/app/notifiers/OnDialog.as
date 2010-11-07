package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnDialogEvent;
	
	[Event(name="result", type="api.events.app.onDialog.OnDialogEvent")]
	[Bindable]
	public class OnDialog extends App
	{
		// Results
		public var captionDialog:String = null;
		public var captionParent:String = null;
		public var hwndDialog:String = null;
		public var isChild:Boolean = true;
		
		public function OnDialog(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_DIALOG} , {callback:actionComplete, errorSTR:"onDialogError", code:"8028"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var __a:Array = r.result.split( "," );
			captionDialog = __a[ 2 ];
			captionParent = __a[ 3 ];
			hwndDialog = __a[ 0 ];
			isChild = checkBoolean( __a[ 1 ] );
			
			var e : OnDialogEvent = new OnDialogEvent( OnDialogEvent.RESULT );
			e.captionDialog = captionDialog;
			e.captionParent = captionParent;
			e.hwndDialog = hwndDialog;
			e.isChild = isChild;
			dispatchEvent( e );
		}
		
	}
}