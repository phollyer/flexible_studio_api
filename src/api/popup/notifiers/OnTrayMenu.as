package api.popup.notifiers
{
	import api.events.popup.notifiers.OnTrayMenuEvent;

	import api.popup.Popup;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.popup.notifiers.OnTrayMenuEvent.RESULT
	*/
	[Event(name="result", type="api.events.popup.onTrayMenu.OnTrayMenuEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_onTrayMenu.html Northcode Help Documentation
	*/
	public class OnTrayMenu extends Popup
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Popup.OnTrayMenu()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_onTrayMenu.html Northcode Help Documentation
		*/
		public function OnTrayMenu(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Popup.setNotify( {event:"onTrayMenu"}
								   ,{callback:actionComplete, errorSTR:"onTrayMenuError", code:"31013"} );
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
			
			var e : OnTrayMenuEvent = new OnTrayMenuEvent( OnTrayMenuEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}	
	}
}