package api.popup.show
{
	import api.events.popup.show.ShowEvent;

	import api.popup.Popup;

	import flash.events.IEventDispatcher;
	
	
	import api.events.popup.show.ShowEvent
	
	/**
	* Dispatched if the Property <code>name</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_NAME
	*/
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.popup.show.ShowEvent.RESULT
	*/
	[Event(name="result", type="api.events.popup.show.ShowEvent")]
	[Bindable]
	/**
	* Display the named popup menu at the current mouse position.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_show.html Northcode Help Documentation
	*/
	public class Show extends Popup
	{
		// Required
		/**
		* The name of the menu to display.
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var itemID:String = null
		
		/**
		* Constructor for Popup.Show()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_show.html Northcode Help Documentation
		*/
		public function Show(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Display the named popup menu at the current mouse position.
		*
		*
		* @param menuName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_show.html Northcode Help Documentation
		*/
		public function show( menuName:String = null ):void
		{
			name = compareStrings( menuName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Popup.show( {name:name}
									  ,{callback:actionComplete, errorSTR:"showError", code:"31010"} );
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
			itemID = r.result;
			
			var e : ShowEvent = new ShowEvent( ShowEvent.RESULT );
			e.itemID = itemID;
			dispatchEvent( e );
		}
	}
}