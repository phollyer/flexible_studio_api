package api.popup.notifiers
{
	import api.events.popup.notifiers.OnContextMenuEvent;

	import api.popup.Popup;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.popup.notifiers.OnContextMenuEvent.RESULT
	*/
	[Event(name="result", type="api.events.popup.onContextMenu.OnContextMenuEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_onContextMenu.html Northcode Help Documentation
	*/
	public class OnContextMenu extends Popup
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Popup.OnContextMenu()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_onContextMenu.html Northcode Help Documentation
		*/
		public function OnContextMenu(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Popup.setNotify( {event:"onContextMenu"}
								   ,{callback:actionComplete, errorSTR:"onContextMenuError", code:"31012"} );
		}
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
			data = r.result;
			
			var e : OnContextMenuEvent = new OnContextMenuEvent( OnContextMenuEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}	
	}
}