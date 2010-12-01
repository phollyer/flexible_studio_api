package api.popup.removeItem
{
	import api.events.popup.removeItem.RemoveItemEvent;

	import api.popup.Popup;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>name</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_NAME
	*/
	[Event(name="missingName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingID" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_removeItem.html Northcode Help Documentation
	*/
	public class RemoveItem extends Popup
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var id:String = null;
		
		/**
		* Constructor for Popup.RemoveItem()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_removeItem.html Northcode Help Documentation
		*/
		public function RemoveItem(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param menuName
		*
		* @param itemID
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_removeItem.html Northcode Help Documentation
		*/
		public function removeItem( menuName:String = null , itemID:String = null ):void
		{
			name = compareStrings( menuName , name );
			id = compareStrings( itemID , id );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					switch( id )
					{
						case null:
							missingID();
							break;
						default:
							ssCore.Popup.removeItem( {name:name , id:id}
												  ,{callback:actionComplete, errorSTR:"removeItemError", code:"31005"} );
					}
			}
		}

	}
}