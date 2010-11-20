package api.popup.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.popup.notifiers.OnContextMenuEvent;
	import api.popup.Popup;
	
	[Event(name="result", type="api.events.popup.onContextMenu.OnContextMenuEvent")]
	[Bindable]
	public class OnContextMenu extends Popup
	{
		// Result
		public var data:String = null;
		
		public function OnContextMenu(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Popup.setNotify( {event:"onContextMenu"}
								   ,{callback:actionComplete, errorSTR:"onContextMenuError", code:"31012"} );
		}
		}	
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : OnContextMenuEvent = new OnContextMenuEvent( OnContextMenuEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}	
	}
}