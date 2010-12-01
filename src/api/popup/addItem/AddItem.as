package api.popup.addItem
{
	import api.events.popup.addItem.AddItemEvent;

	import api.popup.Popup;

	import api.vos.popup.ItemVO;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>item</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_ITEM
	*/
	[Event(name="missingItem" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_addItem.html Northcode Help Documentation
	*/
	public class AddItem extends Popup
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var item:ItemVO = null;
		
		/**
		* Constructor for Popup.AddItem()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_addItem.html Northcode Help Documentation
		*/
		public function AddItem(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param itemVO
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Popup_addItem.html Northcode Help Documentation
		*/
		public function addItem( itemVO:ItemVO = null ):void
		{
			item = compareVOs( itemVO , item );
			switch( item )
			{
				case null:
					missingItem();
					break;
				default:
					ssCore.Popup.addItem( {name:item.name , id:item.id , parent:item.parent , text:item.text , type:item.type , flags:item.flags}
										,{callback:actionComplete, errorSTR:"addItemError", code:"31000"} );
			}
		}
		private function compareVOs( first:ItemVO , second:ItemVO ):ItemVO
		{
			switch( first )
			{
				case null:
					first = second;
			}
			return first;
		}
	}
}