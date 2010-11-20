package api.tray.notifiers
{
	import api.events.tray.notifiers.OnTrayDoubleClickEvent;

	import api.tray.Tray;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.tray.notifiers.OnTrayDoubleClickEvent.RESULT
	*/
	[Event(name="result", type="api.events.tray.onTrayDoubleClick.OnTrayDoubleClickEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_onTrayDoubleClick.html Northcode Help Documentation
	*/
	public class OnTrayDoubleClick extends Tray
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var button:String = null;
		
		/**
		* Constructor for Tray.OnTrayDoubleClick()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_onTrayDoubleClick.html Northcode Help Documentation
		*/
		public function OnTrayDoubleClick(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tray.setNotify( {event:"onTrayDoubleClick"}
							 	  ,{callback:actionComplete, errorSTR:"onTrayDoubleClickError", code:"43007"} );
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
			button = r.result;
			
			var e : OnTrayDoubleClickEvent = new OnTrayDoubleClickEvent( OnTrayDoubleClickEvent.RESULT );
			e.button = button;
			dispatchEvent( e );
		}
	}
}